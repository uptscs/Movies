//
//  MovieParser.m
//  Movies
//
//  Created by admin on 13/03/15.
//  Copyright (c) 2015 Upendra. All rights reserved.
//

#import "MovieParser.h"
#import "Movie.h"

#define kTotalCoutnKey              @"total"
#define kMoviesKey                  @"movies"

@implementation MovieParser

+(NSArray *)movieListParser : (id)responseData{
    NSDictionary * responseDict = responseData;
    NSArray *movies = [responseDict valueForKey:kMoviesKey];
    NSMutableArray *movieList = [[NSMutableArray alloc] initWithCapacity:movies.count];
    if (movies.count) {
        for (NSDictionary *movieDict in movies) {
            Movie *movie = [[Movie alloc]initWithMovieDictionary:movieDict];
            [movieList addObject:movie];
        }
    }
    return movieList;
}

+(NSUInteger)totalMovieCount : (id)responseData{
    NSDictionary * responseDict = responseData;
    NSString *totalCount = [responseDict objectForKey:kTotalCoutnKey];
    return [totalCount intValue];
}

@end
