//
//  MovieTableviewCell.m
//  Movies
//
//  Created by admin on 12/03/15.
//  Copyright (c) 2015 Upendra. All rights reserved.
//

#import "MovieTableviewCell.h"
#import "UIImageView+WebCache.h"

@implementation MovieTableviewCell

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
    _movie = movie;
    self.labelMovieName.text = [NSString stringWithFormat:@"Movie: %@",_movie.movieName ];
    self.lableMovieReleaseDate.text = [NSString stringWithFormat:@"Release: %@", _movie.movieReleaseDate];
    [self.imageViewMoviePoster sd_setImageWithURL:[NSURL URLWithString:_movie.moviePosterThumbPath] placeholderImage:[UIImage imageNamed:@"MovieImagePlaceholder"]];
}

@end
