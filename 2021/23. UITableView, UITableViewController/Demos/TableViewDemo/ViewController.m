//
//  ViewController.m
//  TableViewDemo
//
//  Created by Victor Semenchuk on 4/19/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "ViewController.h"
#import "ShoppingItem.h"
#import "ShoppingItemTableViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray<ShoppingItem *> *dataSource;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fillInitialDataSource];
    [self setupViews];
}

#pragma mark - Private views methods

- (void)setupViews {

    // Navigation items setup
    self.navigationItem.title = @"Shopping list";
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                   target:self
                                                                                   action:@selector(showAddItemAlert)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                                       target:self
                                                                                       action:@selector(toggleEditingMode)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;

    // Setup tableView
    self.tableView = [[UITableView alloc] init];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:ShoppingItemTableViewCell.class forCellReuseIdentifier:@"CellId"];
    [self.view addSubview:self.tableView];
    [NSLayoutConstraint activateConstraints:@[
        [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    ]];
}

- (void)addItem:(NSString *)item {
    [self.dataSource addObject:[[ShoppingItem alloc] initWithTitle:item]];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.dataSource.count - 1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShoppingItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    [cell configureWithShoppingItem:self.dataSource[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}

- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView leadingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    __weak typeof(self) weakSelf = self;
    UIContextualAction *checkAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:@"Check" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        weakSelf.dataSource[indexPath.row].completed = !weakSelf.dataSource[indexPath.row].completed;
//        [weakSelf.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        ShoppingItemTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        [cell configureWithShoppingItem:weakSelf.dataSource[indexPath.row]];
        completionHandler(YES);
    }];
    checkAction.backgroundColor = [UIColor colorWithRed:50.0/255.0 green:215.0/255.0 blue:75.0/255.0 alpha:255.0/255.0];
    return [UISwipeActionsConfiguration configurationWithActions:@[checkAction]];
}

- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    __weak typeof(self) weakSelf = self;
    UIContextualAction *deleteAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"Delete" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        [weakSelf.dataSource removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        completionHandler(YES);
    }];
    return [UISwipeActionsConfiguration configurationWithActions:@[deleteAction]];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleNone;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    ShoppingItem *item = self.dataSource[sourceIndexPath.row];
    [self.dataSource removeObjectAtIndex:sourceIndexPath.row];
    [self.dataSource insertObject:item atIndex:destinationIndexPath.row];
    [self.tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
}

#pragma mark - Handlers

- (void)showAddItemAlert {

    // Create UIAlertController instance
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"New item"
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleAlert];

    // Configure text field
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Apples...";
    }];

    // Configure Done action
    __weak typeof(self) weakSelf = self;
    UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"Done"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
        NSString *enteredText = alertController.textFields.firstObject.text;
        if (enteredText.length > 0) {
            [weakSelf addItem:enteredText];
        }
    }];

    // Configure Cancel action
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];

    // Add actions into alert controller
    [alertController addAction:doneAction];
    [alertController addAction:cancelAction];

    // Present alert controller
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)toggleEditingMode {
    self.tableView.editing = !self.tableView.editing;
}


#pragma mark - Data source init

- (void)fillInitialDataSource {
    self.dataSource = [NSMutableArray arrayWithArray:@[
        [[ShoppingItem alloc] initWithTitle:@"Oranges dsggofjlgrejglkjgklerjgkrejgegj sadsdadas"],
        [[ShoppingItem alloc] initWithTitle:@"Milk"],
        [[ShoppingItem alloc] initWithTitle:@"Cookies"],
        [[ShoppingItem alloc] initWithTitle:@"Apples"],
        [[ShoppingItem alloc] initWithTitle:@"Sweets"]
    ]];
}

@end
