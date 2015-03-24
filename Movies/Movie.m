//
//  Movie.m
//  Movies
//
//  Created by admin on 12/03/15.
//  Copyright (c) 2015 Upendra. All rights reserved.
//

#import "Movie.h"

#define STRING_NIL_CHECK(x) (x == nil ? @"" : x)

#define kMovieTitleKey              @"title"
#define kMovieReleaseDateKey        @"release_dates"
#define kMovieReleaseDateDVDKey     @"dvd"
#define kMovieReleaseDateTheaterKey @"theater"
#define kMoviePosterThumbnailKey    @"thumbnail"
#define kMoviePostersKey            @"posters"
#define kMoviePostersDetailedKey    @"detailed"
#define kMovieIdKey                 @"id"
#define kMovieYearKey               @"year"
#define kMovieRatingsKey            @"ratings"
#define kMovieRatingKey             @"mpaa_rating"
#define kMovieRuntimeKey            @"runtime"
#define kMovieCriticsRatingKey      @"critics_rating"
#define kMovieCriticsScroreKey      @"critics_score"
#define kMovieAudianceRatingKey     @"audience_rating"
#define kMovieAudianceScoreKey      @"audience_score"
#define kMovieSynopsisKey           @"synopsis"



@implementation Movie

-(id)initWithMovieDictionary:(NSDictionary *)movieDict{
    if(self = [super init]){
        _movieName = STRING_NIL_CHECK([movieDict valueForKey:kMovieTitleKey]);
        NSDictionary *releaseDateDictionary = [movieDict valueForKey:kMovieReleaseDateKey];
        _movieReleaseDate = STRING_NIL_CHECK([releaseDateDictionary objectForKey:kMovieReleaseDateTheaterKey]);
        NSDictionary *posterDict = [movieDict objectForKey:kMoviePostersKey];
        _moviePosterThumbPath = STRING_NIL_CHECK([posterDict valueForKey:kMoviePosterThumbnailKey]);
        _moviePosterDetailedPath = STRING_NIL_CHECK([posterDict valueForKey:kMoviePostersDetailedKey]);
        _movieID = STRING_NIL_CHECK([movieDict valueForKey:kMovieIdKey]);
        _movieYear = [[movieDict valueForKey:kMovieYearKey] intValue];
        _movieRating = STRING_NIL_CHECK([movieDict valueForKey:kMovieRatingKey]);
        _movieRuntime = [[movieDict valueForKey:kMovieRuntimeKey] intValue];
        NSDictionary *ratingsDict = [movieDict valueForKey:kMovieRatingsKey];
        _movieCriticsRating = STRING_NIL_CHECK([ratingsDict valueForKey:kMovieCriticsRatingKey]);
        _movieCriticsScore = [[ratingsDict valueForKey:kMovieCriticsScroreKey] intValue];
        _movieAudienceRating = STRING_NIL_CHECK([ratingsDict valueForKey:kMovieAudianceRatingKey]);
        _movieAudienceScore = [[ratingsDict valueForKey:kMovieAudianceScoreKey] intValue];
        _movieSynopsis = STRING_NIL_CHECK([movieDict valueForKey:kMovieSynopsisKey]);
    }
    return self;
}

@end
