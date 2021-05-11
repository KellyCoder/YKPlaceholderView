//
//  TableViewController.m
//  YKPlaceholderView
//
//  Created by Kevin on 2021/5/11.
//

#import "TableViewController.h"
#import "YKPlaceholderHeader.h"

@interface TableViewController () <YKTableViewPlaceholderDelegate>

@property (nonatomic, strong) NSArray * dataArray;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[
        @"test 1",
        @"test 2",
        @"test 3"
    ];
}

#pragma mark - YKTableViewPlaceholderDelegate
- (UIView *)yk_makePlaceholderView {
    EmptyPlaceholderView *view = [EmptyPlaceholderView loadXibView];
    
    view.emptyOverlayClicked = ^{
        // 这里做你想做的事
        self.dataArray = @[
            @"test 1",
            @"test 2",
            @"test 3"
        ];
        
        [self.tableView yk_reloadData];
    };
    return view;
}

#pragma mark - UITableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.dataArray = @[];
    [self.tableView yk_reloadData];
}
@end
