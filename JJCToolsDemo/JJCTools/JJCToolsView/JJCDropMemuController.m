//
//  JJCDropMemuController.m
//  LiveHere
//
//  Created by mxgx on 2019/4/11.
//  Copyright © 2019 苜蓿鬼仙. All rights reserved.
//

#import "JJCDropMemuController.h"
#import "JJCToolsDefine.h"


#define JJC_ScreenW         [UIScreen mainScreen].bounds.size.width
#define JJC_iPhoneX         ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define JJC_StatusNav_H     (K_Status_H + 44.0f)                   // 状态栏 + 导航栏 高度

#define JJC_HexColor(HexColor)      [UIColor colorWithRed:((float)((HexColor & 0xFF0000) >> 16))/255.0 green:((float)((HexColor & 0xFF00) >> 8))/255.0 blue:((float)(HexColor & 0xFF))/255.0 alpha:1]

#define JJC_ViewBorderRadius(view, radius)\
[view.layer setCornerRadius:(radius)];\
[view.layer setMasksToBounds:YES];


static NSString *const DropMemuCellID = @"DropMemuCellID";

@interface  JJCDropMemuController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) CGFloat      jjc_maxHeight;   // 显示高度

@end

@implementation JJCDropMemuController

- (instancetype)init {
    if (self = [super init]) {
        
        self.jjc_type = JJCDropMemuTypeDown;
        self.jjc_maxWidth = JJC_ScreenW / 3;
        self.jjc_startPoint = CGPointMake(JJC_ScreenW-10.0f-self.jjc_maxWidth, JJC_StatusNav_H);
        
        self.jjc_backgroundColor = [UIColor blackColor];
        self.jjc_separatorColor = JJC_HexColor(0x313236);
        self.jjc_cornerRadius = 2.0f;
        self.jjc_maxRowNum = 5;
        self.jjc_rowHeight = 50.0f;
        self.jjc_separatorLeftSpace  = 0;
        self.jjc_separatorRightSpace = 0;
        self.jjc_textColor = [UIColor whiteColor];
        self.jjc_textFont = [UIFont systemFontOfSize:15.0f];
        self.jjc_textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.jjc_maxRowNum = self.jjc_dataArray.count > self.jjc_maxRowNum ? self.jjc_maxRowNum:self.jjc_dataArray.count;
    self.jjc_maxHeight = self.jjc_rowHeight * self.jjc_maxRowNum;
    [self.tableView reloadData];
    
    [self showAnimation];
}


#pragma mark --------------------
#pragma mark --------------------  Method  --------------------

- (void)showAnimation {
    
    [UIView animateWithDuration:0.3 animations:^{
        self.tableView.frame = CGRectMake(self.jjc_startPoint.x, self.jjc_startPoint.y, self.jjc_maxWidth, self.jjc_maxHeight);
    }];
}

- (void)hideAnimation {
    
    [UIView animateWithDuration:0.3 animations:^{
        self.tableView.frame = CGRectMake(self.jjc_startPoint.x, self.jjc_startPoint.y, self.jjc_maxWidth, CGFLOAT_MIN);
    } completion:^(BOOL finished) {
        if (finished) {
            if (self.jjc_dropMemuDismissBlock) {
                self.jjc_dropMemuDismissBlock();
            }
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = touches.anyObject;
    if (![touch.view isEqual:self.tableView]) {
        [self hideAnimation];
    }
}


#pragma mark --------------------
#pragma mark --------------------  Lazy Loading  --------------------

- (UITableView *)tableView {
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.jjc_startPoint.x, self.jjc_startPoint.y, self.jjc_maxWidth, CGFLOAT_MIN) style:UITableViewStylePlain];
        _tableView.backgroundColor = self.jjc_backgroundColor;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = self.jjc_rowHeight;
        _tableView.separatorColor = self.jjc_separatorColor;
        JJC_ViewBorderRadius(_tableView, self.jjc_cornerRadius);
        [self.view addSubview:_tableView];
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:DropMemuCellID];
        
        if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [_tableView setSeparatorInset:UIEdgeInsetsMake(0, self.jjc_separatorLeftSpace, 0, self.jjc_separatorRightSpace)];
        }
        if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
            [_tableView setLayoutMargins:UIEdgeInsetsMake(0, self.jjc_separatorLeftSpace, 0, self.jjc_separatorRightSpace)];
        }
    }
    return _tableView;
}


#pragma mark --------------------
#pragma mark --------------------  UITableViewDataSource、 UITableViewDelegate  --------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.jjc_dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DropMemuCellID forIndexPath:indexPath];
    cell.backgroundColor = self.jjc_backgroundColor;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSDictionary *dict = self.jjc_dataArray[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[dict objectForKey:@"image"]];
    cell.textLabel.text = [dict objectForKey:@"title"];
    cell.textLabel.textColor = self.jjc_textColor;
    cell.textLabel.font = self.jjc_textFont;
    cell.textLabel.textAlignment = self.jjc_textAlignment;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.jjc_dropMemuActionBlock) {
        self.jjc_dropMemuActionBlock(indexPath.row);
    }
    
    [self hideAnimation];
}



@end
