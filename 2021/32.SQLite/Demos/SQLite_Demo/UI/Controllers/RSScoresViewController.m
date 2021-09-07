//
//  RSScoresViewController.m
//  SQLite_Demo
//
//  Created by Victor Semenchuk on 6/24/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "RSScoresViewController.h"
#import "RSStudent.h"
#import "RSScoreTableViewCell.h"
#import "RSStudentFormViewController.h"
#import "SQLiteManager.h"

NSString *kCellReusableIdentifier = @"RSScoreTableViewCell";

@interface RSScoresViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray<RSStudent *> *dataSource;

@end

@implementation RSScoresViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataSource = [NSMutableArray new];
    [self setupTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self fetchData];
}

#pragma mark - Handlers

- (void)fetchData {
    NSArray<RSStudent *> *students = [[SQLiteManager sharedInstance] students];
    if (students) {
        self.dataSource = [NSMutableArray arrayWithArray:students];
        [self.tableView reloadData];
    }
}

- (void)removeStudentAtIndexPath:(NSIndexPath *)indexPath completion:(void(^)(void))completion {
    RSStudent *student = self.dataSource[indexPath.row];
    BOOL result = [[SQLiteManager sharedInstance] deleteStudent:student];
    if (result) {
        if (completion) {
            completion();
        }
    }
}

- (void)updateStudentAtIndexPath:(NSIndexPath *)indexPath completion:(void(^)(void))completion {
    RSStudent *student = self.dataSource[indexPath.row];
    __weak typeof(self) weakSelf = self;
    RSStudentFormViewController *vc = [[RSStudentFormViewController alloc] initWithStudent:student completion:^(RSStudent *updatedStudent) {
        RSStudent *resultStudent = [[SQLiteManager sharedInstance] updateStudent:updatedStudent];
        if (resultStudent) {
            [weakSelf.dataSource replaceObjectAtIndex:indexPath.item withObject:resultStudent];
            if (completion) {
                completion();
            }
        }
    }];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:vc];
    navVC.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:navVC animated:YES completion:nil];
}

- (void)addPersonTapped {
    __weak typeof(self) weakSelf = self;
    RSStudentFormViewController *vc = [[RSStudentFormViewController alloc] initWithStudent:nil completion:^(RSStudent *addedStudent) {
        typeof(weakSelf) strongSelf = weakSelf;
        RSStudent *resultStudent = [[SQLiteManager sharedInstance] addStudent:addedStudent];
        if (resultStudent) {
            [strongSelf.dataSource addObject:resultStudent];
            [strongSelf.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:strongSelf.dataSource.count - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:vc];
    navVC.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:navVC animated:YES completion:nil];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RSScoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReusableIdentifier forIndexPath:indexPath];
    [cell confgureWithStudent:self.dataSource[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0;
}

- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIContextualAction *editAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal
                                                                         title:@"Edit" handler:^(UIContextualAction *action,
                                                                                                 __kindof UIView *sourceView,
                                                                                                 void (^completionHandler)(BOOL)) {
        [self updateStudentAtIndexPath:indexPath completion:^{
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }];

    }];
    editAction.backgroundColor = [UIColor colorWithRed:209.0/255.0 green:209.0/255.0 blue:214.0/255.0 alpha:255.0/255.0];

    UIContextualAction *deleteAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive
                                                                               title:@"Delete"
                                                                             handler:^(UIContextualAction *action,
                                                                                       __kindof UIView *  sourceView,
                                                                                       void (^completionHandler)(BOOL)) {
        [self removeStudentAtIndexPath:indexPath completion:^{
            [self.dataSource removeObjectAtIndex:indexPath.row];
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }];
    }];
    deleteAction.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:59.0/255.0 blue:48.0/255.0 alpha:255.0/255.0];

    UISwipeActionsConfiguration *configuration = [UISwipeActionsConfiguration configurationWithActions:@[deleteAction, editAction]];
    return configuration;
}

#pragma mark - Private methods

- (void)setupTableView {
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"RS_School_Logo"]];
    self.tableView.contentInset = UIEdgeInsetsMake(16.0, 0.0, 0.0, 0.0);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorColor = [UIColor colorWithRed:229.0/255.0 green:229.0/255.0 blue:234.0/255.0 alpha:255.0/255.0];
    self.tableView.backgroundColor = [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:247.0/255.0 alpha:255.0/255.0];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.tableView registerNib:[UINib nibWithNibName:@"RSScoreTableViewCell" bundle:nil] forCellReuseIdentifier:kCellReusableIdentifier];

    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"person.crop.circle.badge.plus"]
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(addPersonTapped)];
    self.navigationItem.rightBarButtonItem = barButtonItem;
}

@end
