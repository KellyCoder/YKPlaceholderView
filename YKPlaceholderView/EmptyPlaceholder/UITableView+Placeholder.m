//
//  UITableView+Placeholder.m
//  ComponentDemo
//
//  Created by Kevin on 2021/5/11.
//

#import "UITableView+Placeholder.h"
#import <objc/runtime.h>

@interface UITableView ()

@property (nonatomic, strong) UIView *placeholderView;

@end

@implementation UITableView (Placeholder)

- (UIView *)placeholderView {
    return objc_getAssociatedObject(self, @selector(placeholderView));
}

- (void)setPlaceholderView:(UIView *)placeholderView {
    objc_setAssociatedObject(self, @selector(placeholderView), placeholderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)yk_reloadData {
    [self reloadData];
    [self yk_checkEmpty];
}

- (void)yk_checkEmpty {
    BOOL isEmpty = YES;
    
    id<UITableViewDataSource> src = self.dataSource;
    NSInteger sections = 1;
    // 获取sections
    if ([src respondsToSelector: @selector(numberOfSectionsInTableView:)]) {
        sections = [src numberOfSectionsInTableView:self];
    }
    // 获取rows
    for (int i = 0; i<sections; ++i) {
        NSInteger rows = [src tableView:self numberOfRowsInSection:i];
        if (rows > 0) {
            isEmpty = NO;
            break;
        }
    }
    
    if (isEmpty) {
        // 模式ScrollView可以滚动
        BOOL scrollEnabled = YES;
        if ([self respondsToSelector:@selector(yk_enableScrollWhenPlaceholderViewShowing)]) {
            scrollEnabled = [[self performSelector:@selector(yk_enableScrollWhenPlaceholderViewShowing)] boolValue];
        }
        else if ([self.delegate respondsToSelector:@selector(yk_enableScrollWhenPlaceholderViewShowing)]) {
            scrollEnabled = [[self.delegate performSelector:@selector(yk_enableScrollWhenPlaceholderViewShowing)] boolValue];
        }
        self.scrollEnabled = scrollEnabled;
        
        // 移除placeholderView
        [self.placeholderView removeFromSuperview];
        // 获取placeholderView
        if ([self respondsToSelector:@selector(yk_makePlaceholderView)]) {
            self.placeholderView = [self performSelector:@selector(yk_makePlaceholderView)];
        }
        else if ( [self.delegate respondsToSelector:@selector(yk_makePlaceholderView)]) {
            self.placeholderView = [self.delegate performSelector:@selector(yk_makePlaceholderView)];
        }
        self.placeholderView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview:self.placeholderView];
    }
    else {
        // rows不为空 移除placeholderView
        [self.placeholderView removeFromSuperview];
        self.placeholderView = nil;
        // 设置可滚动
        self.scrollEnabled = YES;
    }
}

@end
