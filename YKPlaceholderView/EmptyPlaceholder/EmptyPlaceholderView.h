//
//  EmptyPlaceholderView.h
//  ComponentDemo
//
//  Created by Kevin on 2021/5/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^EmptyOverlayClicked)(void);

@interface EmptyPlaceholderView : UIView

/** 按钮点击回调 */
@property (nonatomic,copy) EmptyOverlayClicked emptyOverlayClicked;

+ (instancetype)loadXibView;

@end

NS_ASSUME_NONNULL_END
