//
//  UITableView+Placeholder.h
//  ComponentDemo
//
//  Created by Kevin on 2021/5/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YKTableViewPlaceholderDelegate <NSObject>

@required

/// 无数据占位视图
- (UIView *)yk_makePlaceholderView;

@optional

/// 占位视图显示时,是否可滚动
- (BOOL)yk_enableScrollWhenPlaceholderViewShowing;

@end

@interface UITableView (Placeholder)

- (void)yk_reloadData;

@end

NS_ASSUME_NONNULL_END
