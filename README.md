##### 自定义TableView列表  
###### 创建ViewController
1. 首先，创建一个Single View Application。  
2. 默认会创建一个View Controller，而我们想要一个Table View Controller，这里先把storyboard中默认的View Controller删除，在库中找到Table View Controller，并创建。  
3. 并且把`ViewController.h`中的  
`@interface ViewController : UIViewController`  
改为
`@interface ViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>`，使我们自定义的类`ViewController`继承自`UITableViewController`，并申明两个代理。
![](http://7i7io5.com1.z0.glb.clouddn.com/tableviewcustom1.png)
4. 
###### 创建自定义单元格类ChatCell
1. 继承自`UITableViewCell`，并生成`".xib"`文件，设置`Class`和`Identifier`
![](http://7i7io5.com1.z0.glb.clouddn.com/tableviewcustom2.png)