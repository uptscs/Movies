//
//  SearchHistoryViewController.m
//  Movies
//
//  Created by admin on 13/03/15.
//  Copyright (c) 2015 Upendra. All rights reserved.
//

#import "SearchHistoryViewController.h"
#import "ViewController.h"

#define kHistoryCellIdentifier @"HistoryCellIdentifier"

@interface SearchHistoryViewController (){
    IBOutlet UITableView *_tableviewSearchHistory;
    NSArray *_searchHistoryList;
    ViewController *_selectedMovieListVC;
}

@end

@implementation SearchHistoryViewController

#pragma mark - View Controller delegates

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)viewWillAppear:(BOOL)animated{
    NSURL *urlforFile = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *historyDataFile = [urlforFile URLByAppendingPathComponent:kHistoryFileName];
    
    NSFileManager *fileManager = [NSFileManager new];
    if ([fileManager fileExistsAtPath:historyDataFile.path]) {
        _searchHistoryList = [[NSArray alloc] initWithContentsOfURL:historyDataFile];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:@"MovieList"]){
        _selectedMovieListVC = [segue destinationViewController];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _searchHistoryList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kHistoryCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = _searchHistoryList[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPat{
    NSIndexPath *selectedIndexpath = [_tableviewSearchHistory indexPathForSelectedRow];
    _selectedMovieListVC.movieSearchString = _searchHistoryList[selectedIndexpath.row];
}

@end
