//
//  ViewController.m
//  111222
//
//  Created by shupengstar on 16/5/10.
//  Copyright © 2016年 YJH. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableview;


//定义两个tableViewCell
@property (nonatomic, strong) TableViewCell *lastTableViewCell;


//当前的tableViewCell
@property (nonatomic, strong) TableViewCell *currentTableViewCell;
@end

@implementation ViewController


//懒加载一个tableViewCell 也是一种安全处理的思想
-(UITableView *)tableview{

    if (!_tableview) {
        _tableview = [[UITableView alloc] init];
        self.tableview.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        self.tableview.backgroundColor = [UIColor clearColor];
        self.tableview.delegate = self;
        self.tableview.dataSource = self;
        
    }
    
    return _tableview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
// 将tableVeiw添加到视图上
    [self.view addSubview:self.tableview];
    // Do any additional setup after loading the view, typically from a nib.
}


//tabelVeiw的代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

//定义一个全局的变   static  不这样写的话  只有下面可以用上面不能用  所以 要鞋全局变量
static NSString* ID = @"cell";

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.namelable.text = @"haha";
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    
    
// 这个值得是被电点击的cell  cellForRowAtIndexPath取出cell 的方法
    TableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSLog(@"%@",cell);
   
//    if (cell == self.currentTableViewCell) {
//        
//         cell.textLabel.text = @"";
//        
//    }else{
    
         self.lastTableViewCell = self.currentTableViewCell;
        
        self.currentTableViewCell = cell;
    
   
        cell.tag = 0;
        
      
        [self addanimated:cell firstCall:YES];
        
        
//    }
    
    
    
}


-(void)addanimated:(TableViewCell *)cell firstCall:(BOOL )first{
    
    @synchronized(self) {
        
        if (first) {
            
            
//            self.lastTableViewCell.tag = 1;
            
        }
        
        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveLinear  animations:^{
            
            cell.namelable.frame = CGRectMake(cell.namelable.frame.origin.x - 8, cell.namelable.frame.origin.y, cell.namelable.frame.size.width,  cell.namelable.frame.size.height);
            
            
            
        } completion:^(BOOL finished) {
            
// 判断条件是 如果这个cell上面的namelabel超出了cell得框架  也是一种安全处理
            if (cell.namelable.frame.origin.x + cell.namelable.frame.size.width < 0) {
                
                cell.namelable.frame = CGRectMake(CGRectGetMaxX(cell.view.frame), 0, 60, cell.view.frame.size.height);
                
                
            }
            
            
            
            
            if (!cell.tag) {
                
                [self addanimated:cell firstCall:NO];
                
            }else{
                
                cell.namelable.frame = CGRectMake((cell.view.frame.size.width - 60) * 0.5, 0, 60, cell.view.frame.size.height);
                
            }
            
            
        }];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
