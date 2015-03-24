//
//  Constants.h
//  Movies
//
//  Created by admin on 13/03/15.
//  Copyright (c) 2015 Upendra. All rights reserved.
//

#ifndef Movies_Constants_h
#define Movies_Constants_h

#define kAPIKey @"knnxdzntn3yug485umz4yymt"

//Following is the original key and not activated so far, for temporary purpose above key has been used.
//@"ntkpdg8g96qh7dpbae27jmjn"

#define kNumberofMoviesPerPage  15


#define kMovieSearchURLwithMovieName(movieSearchName, requestedPageNumber) [NSString stringWithFormat:@"http://api.rottentomatoes.com/api/public/v1.0/movies.json?q=%@&page_limit=%d&page=%lu&apikey=%@", movieSearchName, kNumberofMoviesPerPage, requestedPageNumber, kAPIKey]

#define kHistoryFileName @"MovieSearchHistoryData.plist"

#endif
