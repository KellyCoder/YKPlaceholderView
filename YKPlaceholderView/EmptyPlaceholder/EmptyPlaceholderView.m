//
//  EmptyPlaceholderView.m
//  ComponentDemo
//
//  Created by Kevin on 2021/5/11.
//

#import "EmptyPlaceholderView.h"

@implementation EmptyPlaceholderView

+ (instancetype)loadXibView{
    EmptyPlaceholderView *view = [[[NSBundle mainBundle]
                                   loadNibNamed:NSStringFromClass([self class])
                                   owner:self
                                   options:nil]
                                  firstObject];
    return view;
}

- (IBAction)emptyBtnClick:(id)sender {
    if(self.emptyOverlayClicked){
        self.emptyOverlayClicked();
    }
}

@end
