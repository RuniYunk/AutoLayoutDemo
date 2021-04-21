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
        
        self.mLabel = UILabel.new;
        self.mLabel.backgroundColor = [UIColor grayColor];
        self.mLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.mLabel.numberOfLines = 0;
        self.mLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self.contentView addSubview:self.mLabel];
        
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[mLabel]-100-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(mLabel)]];
        
        //[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[mLabel]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(mLabel)]];
        
        
    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
