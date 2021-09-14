//
//  TableViewController.m
//  CoreDataDemo
//
//  Created by Vadim Nevyglas on 7/12/20.
//  Copyright © 2020 Vadim Nevyglas. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "AppDelegate.h"
#import "Song+CoreDataProperties.h"

const NSString *kSongName = @"song";
const NSString *kArtist = @"artist";
const NSString *kAlbum = @"album";

@interface TableViewController () <NSFetchedResultsControllerDelegate>

@property (nonatomic) NSFetchedResultsController *frc;

@end

@implementation TableViewController

- (NSManagedObjectContext *)viewContext {
    return ((AppDelegate *)UIApplication.sharedApplication.delegate).persistentContainer.viewContext;
}

- (NSManagedObjectContext *)newBackgroundContext {
    return ((AppDelegate *)UIApplication.sharedApplication.delegate).persistentContainer.newBackgroundContext;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self viewContext].automaticallyMergesChangesFromParent = YES;
    
    self.frc = [[NSFetchedResultsController alloc] initWithFetchRequest:[Song fetchRequest] managedObjectContext:[self viewContext] sectionNameKeyPath:nil cacheName:nil];
    self.frc.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.frc performFetch:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.frc.fetchedObjects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    
    [cell configureWithSong:self.frc.fetchedObjects[indexPath.row]];
    
    return cell;
}


#pragma mark - Delegate

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Удалять можно точно так же с другого контекста
        // а т.к. viewContext.automaticallyMergesChangesFromParent == YES
        // изменения будут отражены на viewContext и соответственно в FRC
        NSManagedObjectContext *context = [self newBackgroundContext];
        
        [context performBlockAndWait:^{
            Song *song = [[[Song fetchRequest] execute:nil] objectAtIndex: indexPath.row];
            [context deleteObject: song];
        }];
        
        [context save:nil];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    __weak typeof(self) weakSelf = self;
    [self showAlertWithCompletion: ^(UIAlertController *alert) {
        typeof(self) strongSelf = weakSelf;
        
        NSManagedObjectContext *context = [strongSelf newBackgroundContext];
        
        [context performBlockAndWait:^{
            // здесь мы получали объект из FRC, а он был привязан к viewContext
            // Song *song = [strongSelf.frc.fetchedObjects objectAtIndex:indexPath.row];
            
            // необходимо использовать объект из контекста в котором мы работаем,
            // иначе могут возникнуть подобные проблемы :)
            NSError *error = nil;
            Song *song = [[[Song fetchRequest] execute:&error] objectAtIndex: indexPath.row];
            song.name = alert.textFields[0].text;
            song.artist = alert.textFields[1].text;
            song.album = alert.textFields[2].text;
        }];
        
        [context save:nil];
    }];
}

#pragma mark - Actions

- (IBAction)didClickAddSong:(id)sender {
    __weak typeof(self) weakSelf = self;
    [self showAlertWithCompletion: ^(UIAlertController *alert) {
        typeof(self) strongSelf = weakSelf;
        
        NSManagedObjectContext *context = [strongSelf newBackgroundContext];
        
        [context performBlockAndWait:^{
            Song *song = [[Song alloc] initWithContext:context];
            song.name = alert.textFields[0].text;
            song.artist = alert.textFields[1].text;
            song.album = alert.textFields[2].text;
        }];
        
        [context save:nil];
    }];
}

- (void)showAlertWithCompletion:(void (^)(UIAlertController *))completion {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Add song" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Song name";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Artist";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Album";
    }];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Add" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completion(alert);
    }]];
    
    [self showViewController:alert sender:self];
}

- (IBAction)didClickAddArtist:(id)sender {
    // do nothing yet
}

#pragma mark - Fetched Results Controller Delegate

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(nullable NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(nullable NSIndexPath *)newIndexPath {
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        default:
            break;
    }
    
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    // not needed
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

@end
