//
//  TableViewCell.m
//  111222
//
//  Created by shupengstar on 16/5/10.
//  Copyright © 2016年 YJH. All rights reserved.
//

#import "TableViewCell.h"
#define kScreenWidth self.view.bounds.size.width
#define kScreenHeight self.view.bounds.size.height

#define kContentWidth self.contentView.bounds.size.width
#define kContentHeight self.contentView.bounds.size.height
@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

//不使用xib   就可以这样纯代码写上去
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        
        self.view = [[UIView alloc] initWithFrame:CGRectMake(kContentWidth/5, kContentHeight/4, kContentWidth/3, kContentHeight/2)];
        
        
// 这里的clip是修剪的意思，bounds是边界的意思是，合起来就是：如果子视图的范围超出了父视图的边界，那么超出的部分就会被裁剪掉。
//   也就是说view的子视图   如果超出了view的框架，那么子视图多余的部分就会被裁剪掉的
//   默认情况下 view的clipsToBounds的默认状态下是NO
        self.view.clipsToBounds = YES;
//   self.contentView子啊这里指代的就是cell
        [self.contentView addSubview:self.view];

// cell addsubView  与 self.contentView addSubview:的区别  就是当cell的内容发生移动的时候 ，cell添加子视图不会发生移动，但是 self.contentView 的子视图就会发生移动   这就是区别
// 还有在设置backgroundColor时，使用cell设置时左移或者右移颜色是不会变的，而用cell.contentCell设置时，移动后的空白会显示cell的默认颜色，这种情况视实际情况选择。
        

        self.namelable = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 60) * 0.5, 0, 60, self.view.frame.size.height)];
        self.namelable.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:self.namelable];
    }
    return self;
}

-(void)layoutSubviews{
    
    
    
    self.view.layer.cornerRadius = 8;
    
    self.view.layer.borderColor = [UIColor blueColor].CGColor;
    
    self.view.layer.borderWidth = 2;
    

    
    [self.contentView addSubview:self.view];
    
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    
//    [super setSelected:selected animated:animated];
//    if (selected) {
//        [self addanimated];
//        
//    }
//    
//    
//    
//
//    // Configure the view for the selected state
//}


@end
