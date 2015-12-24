##一、UICollectionView的简介
UICollectionView是IOS 6中引进的列表展现控件，用于展示集合视图，布局更加灵活，可以高度定制内容的展现，可以有效的进行数据管理，即使对于大量数据，也非常的高效。苹果官方给出了Demo（[点我下载](https://developer.apple.com/library/ios/samplecode/CollectionView-Simple/Introduction/Intro.html#//apple_ref/doc/uid/DTS40012860)）是一个类似于Android里面的GridView的实现。和UITableView的实现相比较，他对于每一个Item都是一次复用，而UITableView只能对于每一行进行复用。如果你认为它仅仅是对GridView在IOS中的实现的话，那你就太小看它的功能了。下面我们就来一起学习UICollectionView的使用方法。

##二、UICollectionView的感性认识
网上有一个书架的举例很经典，很好的说明了UICollectionView的表现形式。如图：![书架案例](http://img.my.csdn.net/uploads/201511/06/1446790428_7727.png)
一个标准的UICollectionView包含三个部分，他们都是UIView的子类：

- Cells 用于展示内容的主体，对于不同的Cell可以指定不同的尺寸和内容。
- Supplementary Views 附加视图，可以理解为UITableView每个Section的HeaderView和FooterView。
- Decoration Views 装饰视图，这是每个section的背景视图，用于装饰该section。

将上图分解为以上三个元素组成的结构，如下图所示：
![书架分解图](http://img.my.csdn.net/uploads/201511/06/1446790216_9577.jpg)

##三、基本原理
UICollectionView 向 UICollectionViewLayout 询问布局，当询问过程发生时，layout 对象会创建 UICollectionViewLayoutAttributes 实例。一个 UICollectionViewLayoutAttributes 对象管理着一个对应的 item layout 相关信息（一对一关系）

##四、实现一个简单的gridview视图
效果如下：
![gridView演示](http://img.blog.csdn.net/20151107210712392)

###第一步：生成UICollectionViewFlowLayout对象，设置他的显示大小、每个item之间的边距和滚动方向。

```
UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH/2-10, SCREEN_WIDTH/2-10);
flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
flowLayout.minimumLineSpacing = 20;//设置每个item之间的间距
```
###第二步：生成collectionView对象，设置他的显示大小、代理方法和其他相关属性。

```
UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.navBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-self.navBarHeight) collectionViewLayout:flowLayout];
collectionView.delegate = self;
collectionView.dataSource = self;
collectionView.showsVerticalScrollIndicator = YES;
collectionView.backgroundColor = [UIColor blackColor];
[self.view addSubview:collectionView];
```
###第三步：注册Cell，重用Cell
首先在初始化的时候注册cell的Id。

```
[self.collectionView registerClass:[Demo1Cell class] forCellWithReuseIdentifier:Demo1CellID];
```
然后在使用Cell的时候，使用以下方法进行重用。

```
Demo1Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Demo1CellID forIndexPath:indexPath];
```
###第四步：实现￼￼￼￼UICollectionViewDataSource的三个代理方法。
- section的数量 ￼-numberOfSectionsInCollection:
- 某个section里有多少个item-collectionView:numberOfItemsInSection:
- 对于某个位置应该显示什么样的cell ￼-collectionView:cellForItemAtIndexPath:


```
#pragma mark- UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
return 31;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
Demo1Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Demo1CellID forIndexPath:indexPath];
if(!cell){
cell = [[Demo1Cell alloc] init];
}
[cell setImageName:[NSString stringWithFormat:@"%zi",indexPath.row] content:[NSString stringWithFormat:@"{%zi,%zi}",indexPath.section,indexPath.row]];
return cell;
}
```
##五、Demo下载地址
[Demo下载地址](https://github.com/yixiangboy/YXCollectionView.git)
如果对你有点帮助，star一下吧。

##六、联系方式
微博：[新浪微博](http://weibo.com/5612984599/profile?topnav=1&wvr=6)
博客：[http://blog.csdn.net/yixiangboy ](http://blog.csdn.net/yixiangboy)
github：[https://github.com/yixiangboy](https://github.com/yixiangboy)