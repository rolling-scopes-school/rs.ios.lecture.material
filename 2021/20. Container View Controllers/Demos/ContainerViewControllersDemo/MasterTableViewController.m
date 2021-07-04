//
//  MasterTableViewController.m
//  ContainerViewControllersDemo
//
//  Created by Victor Semenchuk on 4/6/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "MasterTableViewController.h"
#import "DetailsViewController.h"

@interface MasterTableViewController ()

@property (nonatomic, copy) NSArray<NSString *> *dataSource;

@end

@implementation MasterTableViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataSource = @[@"doc.fill", @"archivebox.fill", @"folder.fill"];
    }
    return self;
}

#pragma mark - Table view data source

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"UITableViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    cell.textLabel.text = self.dataSource[indexPath.row];
    cell.imageView.image = [UIImage systemImageNamed:self.dataSource[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *imageName = self.dataSource[indexPath.row];
    DetailsViewController *viewController = [[DetailsViewController alloc] initWithImageName:imageName];
    [self.splitViewController showDetailViewController:viewController sender:self];
}

@end
