# YKPlaceholderView
 UITableView、UICollectionView空数据占位视图，支持xib自定义占位视图，一行代码搞定

### 一、基于runtime封装UITableView、UICollectionView空数据占位视图,一行代码解决繁杂的数据判断过程

### 二、支持xib自定义空白占位视图,更快定制属于自己的占位视图

详细用法参考[YKPlaceholderView](https://github.com/KellyCoder/YKPlaceholderView)

## UITableView+Placeholder

> 首选遵循 YKTableViewPlaceholderDelegate 协议

> 实现协议方法

```

#pragma mark - YKTableViewPlaceholderDelegate
- (UIView *)yk_makePlaceholderView {
    EmptyPlaceholderView *view = [EmptyPlaceholderView loadXibView];
    
    view.emptyOverlayClicked = ^{
        // 这里做你想做的事
        [self.tableView yk_reloadData];
    };
    return view;
}

```

> 刷新表格方法要使用 yk_reloadData 替换掉原生的 reloadData

#### UICollectionView+Placeholder 使用方法与 UITableView+Placeholder 同理,具体请参考[Demo](https://github.com/KellyCoder/YKPlaceholderView)




