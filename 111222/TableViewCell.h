//
//  TableViewCell.h
//  111222
//
//  Created by shupengstar on 16/5/10.
//  Copyright © 2016年 YJH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property(nonatomic, strong) UIView* view;

@property(nonatomic, strong) UILabel* namelable;

@property(nonatomic, assign) NSInteger tag;

@end
