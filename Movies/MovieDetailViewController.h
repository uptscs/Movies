//
//  MovieDetailViewController.h
//  Movies
//
//  Created by admin on 13/03/15.
//  Copyright (c) 2015 Upendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieTableviewCell.h"

@interface MovieDetailCell : MovieTableviewCell

@property(nonatomic, weak) IBOutlet UILabel *labelMovieRuntime;
@property(nonatomic, weak) IBOutlet UILabel *labelMovieYear;
@property(nonatomic, weak) IBOutlet UILabel *labelMovieRating;
@property(nonatomic, weak) IBOutlet UIImageView *imageviewDetailPoster;

@property(nonatomic, strong) Movie *movie;

@end

@interface MovieRatingCell : UITableViewCell

@property(nonatomic, weak) IBOutlet UILabel *labelAudianceRating;
@property(nonatomic, weak) IBOutlet UILabel *labelAudianceScore;
@property(nonatomic, weak) IBOutlet UILabel *labelCriticsRating;
@property(nonatomic, weak) IBOutlet UILabel *labelCriticsScore;

@property(nonatomic, strong) Movie *movie;

@end


@interface MovieSynopsisCell : UITableViewCell

@property(nonatomic, weak) IBOutlet UITextView *textviewSynopsis;

@property(nonatomic, strong) Movie *movie;

@end




@class Movie;

@interface MovieDetailViewController : UIViewController

@property(nonatomic, strong) Movie *movie;

@end
