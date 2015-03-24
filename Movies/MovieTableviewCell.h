//
//  MovieTableviewCell.h
//  Movies
//
//  Created by admin on 12/03/15.
//  Copyright (c) 2015 Upendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieTableviewCell : UITableViewCell

@property(nonatomic, weak) IBOutlet UILabel *labelMovieName;
@property(nonatomic, weak) IBOutlet UILabel *lableMovieReleaseDate;
@property(nonatomic, weak) IBOutlet UIImageView *imageViewMoviePoster;

@property(nonatomic, strong) Movie *movie;

@end
