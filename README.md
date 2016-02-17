##本DEMO总共包括7个案例，分别如下：<br/>
###Demo1:网格视图<br/>
![网格视图](http://img.my.csdn.net/uploads/201512/24/1450924992_6572.gif)<br/>
###Demo2:无限轮播<br/>
![无限轮播](http://img.my.csdn.net/uploads/201512/24/1450924937_1121.gif)<br/>
###Demo3:照片墙<br/>
![照片墙](http://img.my.csdn.net/uploads/201512/24/1450924937_2933.gif)<br/>
###Demo4:瀑布流<br/>
![瀑布流](http://img.my.csdn.net/uploads/201512/24/1450924938_5353.gif)<br/>
###Demo5:列表头部拉伸效果<br/>
![列表头部拉升效果](http://img.my.csdn.net/uploads/201512/24/1450924939_8493.gif)<br/>
###Demo6:倾斜的Cell<br/>
![倾斜的cell](http://img.my.csdn.net/uploads/201512/14/1450064085_6773.gif)<br/>
###Demo7:列表顶部逐渐增大效果<br/>
![列表顶部逐渐增大效果](http://img.my.csdn.net/uploads/201512/24/1450925034_1941.gif)<br/>

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

##四、案例学习地址
1：[网格视图](http://blog.csdn.net/yixiangboy/article/details/49683345)<br/>
2：[无限轮播](http://blog.csdn.net/yixiangboy/article/details/49705953)<br/>
3：[列表头部拉伸效果](http://blog.csdn.net/yixiangboy/article/details/49718197)<br/>
4：[倾斜列表效果](http://blog.csdn.net/yixiangboy/article/details/49795431)<br/>

##五、Demo下载地址
[Demo下载地址](https://github.com/yixiangboy/YXCollectionView.git)
如果对你有点帮助，star一下吧。

##六、联系方式（欢迎关注，欢迎加好友）
微博：[新浪微博](http://weibo.com/5612984599/profile?topnav=1&wvr=6)<br/>
博客：[http://blog.csdn.net/yixiangboy ](http://blog.csdn.net/yixiangboy)<br/>
github：[https://github.com/yixiangboy](https://github.com/yixiangboy)<br/>
