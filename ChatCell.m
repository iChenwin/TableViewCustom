//
//  ChatCell.m
//  ChatView
//
//  Created by wayne on 16/5/30.
//  Copyright © 2016年 wayne. All rights reserved.
//

#import "ChatCell.h"

@interface ChatCell ()
@property NSUInteger numofPic;
@property NSUInteger numPerRow;
@end

@implementation ChatCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier data:(NSDictionary *)data{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        self = [[[NSBundle mainBundle]loadNibNamed:@"ChatCell" owner:self options:nil] objectAtIndex:0];
        
        self.nameLabel.text = [data objectForKey:@"name"];
        NSArray *arrPic = [data objectForKey:@"images"];
        
        self.numofPic = arrPic.count;
        
        for (int i=0; i<arrPic.count; i++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            
            NSUInteger row, column;
            self.numPerRow = 2;
            row = i / self.numPerRow;
            column = i % self.numPerRow;
            [imageView setFrame:CGRectMake(90 + column * 120, 20 + row * 120, 100, 100)];
            
            imageView.image = [UIImage imageNamed:arrPic[i]];
            
            [self.view addSubview:imageView];
            
            
        }
        self.accessoryType = UITableViewCellAccessoryNone;
    }
    return self;
}

-(NSUInteger) getHeight{
    return ((self.numofPic - 1) / self.numPerRow + 1) * 130;
}

- (id)initWithData:(NSArray *)data{
    self = [super init];
    if (self){
        self = [[[NSBundle mainBundle]loadNibNamed:@"ChatCell" owner:self options:nil] objectAtIndex:0];
    }
    return self;
}

@end
