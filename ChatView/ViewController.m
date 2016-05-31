//
//  ViewController.m
//  ChatView
//
//  Created by wayne on 16/5/30.
//  Copyright © 2016年 wayne. All rights reserved.
//

#import "ViewController.h"
#import "ChatCell.h"
#import "DetailViewController.h"

@interface ViewController ()
@property (nonatomic) NSMutableArray *heights;
@end

@implementation ViewController
- (NSMutableArray *)heights{
    //将变量初始化放在getter函数中，可以使变量被调用时才创建，避免占用过多占用内存
    if (!_heights) {    
        _heights = [[NSMutableArray alloc] init];
    }
    return _heights;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"Users" ofType:@"plist"];
    
    self.listUsers = [[NSArray alloc] initWithContentsOfFile:plistPath];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listUsers count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"CellIdentifier";
    NSUInteger row = [indexPath row];
    NSDictionary *rowDict = [self.listUsers objectAtIndex:row];
    ChatCell *cell = [[ChatCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier data:rowDict];
    //新建tap手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    //设置点击次数和点击手指数
    tapGesture.numberOfTapsRequired = 2; //点击次数
    tapGesture.numberOfTouchesRequired = 1; //点击手指数
    cell.userInteractionEnabled = YES; // Default is NO
    [cell addGestureRecognizer:tapGesture];
    
    NSInteger height = [cell getHeight];
    self.heights[row] = [NSNumber numberWithInteger:height];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger row = [indexPath row];
    if (self.heights.count > 0) {
        return [self.heights[row] floatValue];
    }
    return 0;
}

//轻击手势触发方法
-(void)tapGesture:(id)sender
{
    //导航至Detail页面
    [self.navigationController pushViewController:[[DetailViewController alloc] init] animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
