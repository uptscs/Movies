//
//  MovieDetailViewController.m
//  Movies
//
//  Created by admin on 13/03/15.
//  Copyright (c) 2015 Upendra. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "UIImageView+WebCache.h"
#import "Movie.h"

@implementation MovieDetailViewController

#pragma mark - View Controller delegates

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _movie.movieName;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            return 485.0;
        case 1:
            return 200.0;
        case 2:
            return 300.0;
        default:
            break;
    }
    return 0.0;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!_movie.movieSynopsis.length) {
        return 2;
    }
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    switch (indexPath.row) {
        case 0:
            cell = (MovieDetailCell *)[tableView dequeueReusableCellWithIdentifier:@"MovieDetailCellIdentifier" forIndexPath:indexPath];
            [(MovieDetailCell *)cell setMovie:_movie];
            break;
        case 1:
            cell = (MovieRatingCell *)[tableView dequeueReusableCellWithIdentifier:@"MovieRatingCell" forIndexPath:indexPath];
            [(MovieRatingCell *)cell setMovie:_movie];
            break;
        case 2:
            cell = (MovieSynopsisCell *)[tableView dequeueReusableCellWithIdentifier:@"MovieSynopsisIdentifier" forIndexPath:indexPath];
            [(MovieSynopsisCell *)cell setMovie:_movie];
            break;
        default:
            break;
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

@end


@implementation MovieDetailCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        //Custom initialization
    }
    return self;
}


-(void)awakeFromNib {
    [super awakeFromNib];
}


-(void)setSelected:(BOOL)selected {
    [super setSelected:selected];
}


-(void)setMovie:(Movie *)movie{
    [super setMovie:movie];
    [_imageviewDetailPoster  sd_setImageWithURL:[NSURL URLWithString:movie.moviePosterDetailedPath] placeholderImage:[UIImage imageNamed:@"MovieImagePlaceholder"]];
    _labelMovieRuntime.text = [NSString stringWithFormat:@"Runtime: %i", movie.movieRuntime];
    _labelMovieYear.text = [NSString stringWithFormat:@"Year: %i", movie.movieYear];
    _labelMovieRating.text = [NSString stringWithFormat:@"Rating : %@", movie.movieRating];
}

@end


@implementation MovieRatingCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        //Custom initialization
    }
    return self;
}


-(void)awakeFromNib {
    [super awakeFromNib];
}


-(void)setSelected:(BOOL)selected {
    [super setSelected:selected];
}


-(void)setMovie:(Movie *)movie{
    _labelAudianceRating.text = [NSString stringWithFormat:@"Audiance Rating : %@", movie.movieAudienceRating];
    _labelAudianceScore.text = [NSString stringWithFormat:@"Audiance Score : %i", movie.movieAudienceScore];
    _labelCriticsRating.text = [NSString stringWithFormat:@"Critics Rating : %@", movie.movieCriticsRating];
    _labelCriticsScore.text = [NSString stringWithFormat:@"Critics Score : %i", movie.movieCriticsScore];
}

@end

@implementation MovieSynopsisCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        //Custom initialization
    }
    return self;
}


-(void)awakeFromNib {
    [super awakeFromNib];
}


-(void)setSelected:(BOOL)selected {
    [super setSelected:selected];
}


-(void)setMovie:(Movie *)movie{
    _textviewSynopsis.text = movie.movieSynopsis;
}

@end
