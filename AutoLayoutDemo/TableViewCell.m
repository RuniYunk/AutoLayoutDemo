//
//  TableViewCell.m
//  AutoLayoutDemo
//
//  Created by Han on 15-3-30.
//  Copyright (c) 2015年 IPingLun. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell
@synthesize mLabel;

- (void)awakeFromNib {
    // Initialization code
}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.mLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
        [self addSubview:self.mLabel];
        
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
