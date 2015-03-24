//
//  ViewController.m
//  Movies
//
//  Created by admin on 12/03/15.
//  Copyright (c) 2015 Upendra. All rights reserved.
//

#import "ViewController.h"
#import "Movie.h"
#import "MovieTableviewCell.h"
#import "MovieDetailViewController.h"
#import "Constants.h"
#import "WebserviceOperation.h"
#import "MovieParser.h"
#import "Reachability.h"

typedef void(^myCompletion)(BOOL);

@interface ViewController (){
    MNMBottomPullToRefreshManager *_pullToRefreshManager;
    NSUInteger _totalMovieCount;
    NSMutableArray *_movieList;
    NSUInteger _currentPage;
}

@property(nonatomic, weak) IBOutlet UITableView *tableviewMovieList;
@property(nonatomic, weak) IBOutlet UISearchBar *searchBarMovie;
@property(nonatomic, weak) IBOutlet UIActivityIndicatorView *activityIndicator;
@property(nonatomic, weak) IBOutlet UIView *viewErrorMessage;
@property(nonatomic, weak) IBOutlet UILabel *labelErrorMessage;

@end

@implementation ViewController

static NSString *MovieCellIdentifier = @"MovieCellIdentifier";

#pragma mark - View Controller delegates

- (void)viewDidLoad {
    [super viewDidLoad];
    _pullToRefreshManager = [[MNMBottomPullToRefreshManager alloc] initWithPullToRefreshViewHeight:60.0f tableView:_tableviewMovieList withClient:self];
    _currentPage = 0;
    [_activityIndicator stopAnimating];
    //IF user moved from history list, search text will be provided
    if (_movieSearchString.length) {
        [self showMessage:@"Searching movie..."];
        _searchBarMovie.text = _movieSearchString;
        [self getMovieListforNextPage];
    }else{
        [self showMessage:@"Type movie name to search"];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _movieList.count;
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     MovieTableviewCell *cell = (MovieTableviewCell *)[tableView dequeueReusableCellWithIdentifier:MovieCellIdentifier forIndexPath:indexPath];
     Movie *movie = _movieList[indexPath.row];
     cell.movie = movie;
     return cell;
}

#pragma mark -
#pragma mark Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"ShowMovieDetail"]){
        NSIndexPath *selectedIndexpath = [_tableviewMovieList indexPathForSelectedRow];
        Movie *selectedMovie = _movieList[selectedIndexpath.row];
        MovieDetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.movie = selectedMovie;
    }
}

#pragma mark -
#pragma mark SearchBar delegate methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSString *movieSearchText = searchBar.text;
    [searchBar resignFirstResponder];
    if (movieSearchText.length) {
        [self showMessage:@"Searching movie....."];
        [self saveSearchStringforHistory:movieSearchText];
        _movieSearchString = movieSearchText;
        _totalMovieCount = _currentPage = 0;
        [self getMovieListforNextPage];
    }else{
        [self showMessage:@"Type movie name to search"];
        _movieList = nil;
        [_tableviewMovieList reloadData];
    }
}

#pragma mark -
#pragma mark MNMBottomPullToRefreshManager delegate methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [_pullToRefreshManager tableViewScrolled];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [_pullToRefreshManager tableViewReleased];
}

- (void)bottomPullToRefreshTriggered:(MNMBottomPullToRefreshManager *)manager {
    [self performSelector:@selector(reloadTablewithPulltoRefresh) withObject:nil afterDelay:0.0f];
}

#pragma mark -
#pragma user defined methods

-(void)showMessage : (NSString *)message{
    [_tableviewMovieList setHidden:YES];
    [_viewErrorMessage setHidden:NO];
    _labelErrorMessage.text = message;
}


-(void)hideMessage{
    [_tableviewMovieList setHidden:NO];
    [_viewErrorMessage setHidden:YES];
}


-(void)startLoadingIndicator{
    [_activityIndicator startAnimating];
}


-(void)stopLoadingIndicator{
    [_activityIndicator stopAnimating];
}


-(BOOL)isNetworkAvailable{
    return !([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == NotReachable);
}


-(void)searchMoviewithName : (NSString *)movieSearchText completion : (myCompletion)completion{
    completion(YES);
}


-(void)getMovieListforNextPage{
    if (![self isNetworkAvailable]) {
        [self showMessage:@"Network is not avaialbale, please check your connection and try again."];
        return;
    }
    __weak id weakSelf = self;
    _currentPage++;
    NSUInteger nextPage = _currentPage;
    _movieSearchString = [_movieSearchString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    dispatch_async(dispatch_get_main_queue(),^
                   {
                       [weakSelf startLoadingIndicator];
                   });
    [WebserviceOperation searchMovie:_movieSearchString requestPageNumber:nextPage completionHander:^(NSError *error, id responseObject){
        if (error != nil) {
            dispatch_async(dispatch_get_main_queue(),^
                           {
                               [weakSelf showMessage:[NSString stringWithFormat:@"%@",error.description]];
                               [weakSelf stopAnimating];
                           });
        }else{
            [weakSelf extractResponse:responseObject];
        }
        dispatch_async(dispatch_get_main_queue(),^
                       {
                           [weakSelf hideMessage];
                           [weakSelf reloadTableviewwithPullFinished];
                       });
    }];
}


-(void)reloadTableviewwithPullFinished{
    [_tableviewMovieList reloadData];
    [_pullToRefreshManager tableViewReloadFinished];
}


-(void)extractResponse : (id)responseObject{
    _totalMovieCount = [MovieParser totalMovieCount:responseObject];
    if (_totalMovieCount > 0) {
        [self stopLoadingIndicator];
        NSArray *movieListReponse = [MovieParser movieListParser:responseObject];
        if (_currentPage == 1) {
            _movieList = [NSMutableArray arrayWithArray:movieListReponse];
        }else{
            [_movieList addObjectsFromArray:movieListReponse];
        }
    }else{
        [self stopLoadingIndicator];
    }
}


-(void)reloadTablewithPulltoRefresh{
    if (_totalMovieCount > _currentPage * kNumberofMoviesPerPage){
        [self getMovieListforNextPage];
    }
    else{
        [_pullToRefreshManager tableViewReloadFinished];
    }
}


-(void)saveSearchStringforHistory:(NSString *)searchText{
    if (!searchText.length)
        return;
    NSMutableArray *historyArray = nil;
    
    NSURL *urlforFile = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *historyDataFile = [urlforFile URLByAppendingPathComponent:kHistoryFileName];
    
    NSFileManager *fileManager = [NSFileManager new];
    if (![fileManager fileExistsAtPath:historyDataFile.path]) {
        [fileManager createFileAtPath:historyDataFile.path contents:nil attributes:nil];
        historyArray = [[NSMutableArray alloc] init];
    }else{
        historyArray = [[NSMutableArray alloc] initWithContentsOfURL:historyDataFile];
    }
    
    if (![historyArray containsObject:searchText]) {
        [historyArray addObject:searchText];
        [historyArray writeToFile:historyDataFile.path atomically:YES];
    }
}

@end
