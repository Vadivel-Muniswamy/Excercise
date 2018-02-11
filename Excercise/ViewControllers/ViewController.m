//
//  ViewController.m
//  Excercise
//
//  Created by MFS on 2/11/18.
//  Copyright © 2018 WiproTest. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+Loader.h"
#import "ItemTableViewCell.h"
#import "ItemDetail.h"
#import "Item.h"
#import "WebService.h"

#define DATA_URL    @"https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
#define CELL_IDENTIFIER @"CellIdentifier"
@interface ViewController () <WebServiceDelegate, ItemDelegate> {
    Item *item;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initailize];
    [self refreshData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
- (void)initailize {
    [self.tableView registerClass:ItemTableViewCell.class forCellReuseIdentifier:CELL_IDENTIFIER];
    self.tableView.allowsSelection = false;
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = UIColor.whiteColor;
    self.refreshControl.tintColor = UIColor.grayColor;
    [self.refreshControl addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];
}

- (void)refreshData {
    [WebService dataTask:DATA_URL delegate:self];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return item.details.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = CELL_IDENTIFIER;
    ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    ItemDetail *detail = [item.details objectAtIndex:indexPath.row];
    [cell configureCell:detail];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemDetail *detail = [item.details objectAtIndex:indexPath.row];
    return [ItemTableViewCell getHeightForItem:detail inView:tableView];
}

#pragma mark -
- (void)response:(BOOL)success data:(NSData *)data {
    [self.refreshControl endRefreshing];
    
    NSError *error;
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:1];
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    id response = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    if (response)
        item = [[Item alloc] initWithDictionary:response];
    else
        item = [[Item alloc] init];
    
    self.title = item.title;
    [self.tableView reloadData];
}

#pragma mark -
- (void)onChangeCellContent:(ItemTableViewCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

#pragma mark -
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [self.tableView reloadData];
}
@end
