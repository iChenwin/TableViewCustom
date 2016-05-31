//
//  ViewController.h
//  ChatView
//
//  Created by wayne on 16/5/30.
//  Copyright © 2016年 wayne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *listUsers;

@end

