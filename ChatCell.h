//
//  ChatCell.h
//  ChatView
//
//  Created by wayne on 16/5/30.
//  Copyright © 2016年 wayne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatCell : UITableViewCell<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier data:(NSDictionary *)data;
- (NSUInteger)getHeight;
@end
