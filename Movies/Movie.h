//
//  Movie.h
//  Movies
//
//  Created by admin on 12/03/15.
//  Copyright (c) 2015 Upendra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property(nonatomic, strong) NSString *movieName;
@property(nonatomic, strong) NSString *movieReleaseDate;
@property(nonatomic, strong) NSString *moviePosterThumbPath;
@property(nonatomic, strong) NSString *moviePosterDetailedPath;
@property(nonatomic, strong) NSString *moviePosterPath;
@property(nonatomic, strong) NSString *movieID;
@property(nonatomic, assign) int       movieYear;
@property(nonatomic, strong) NSString *movieRating;
@property(nonatomic, assign) int       movieRuntime;
@property(nonatomic, strong) NSString *movieCriticsRating;
@property(nonatomic, assign) int       movieCriticsScore;
@property(nonatomic, strong) NSString *movieAudienceRating;
@property(nonatomic, assign) int       movieAudienceScore;
@property(nonatomic, strong) NSString *movieSynopsis;

-(id)initWithMovieDictionary:(NSDictionary *)movieDict;

@end
