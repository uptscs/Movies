//
//  WebserviceOperation.m
//  Movies
//
//  Created by admin on 12/03/15.
//  Copyright (c) 2015 Upendra. All rights reserved.
//

#import "WebserviceOperation.h"
#import "Reachability.h"
#import "AFHTTPRequestOperationManager.h"

static WebserviceOperation *sharedInstance;

@implementation WebserviceOperation

-(id)initOperationForUrl: (NSString *) inUrl withParams:(NSDictionary *)inParams havingHTTPMethod:(NSString *) inHTTPMethod checkTimeout:(BOOL) isTimeoutValid {
    if(self = [super init]){
    
    }
    return self;
}


+(void)searchMovie: (NSString *)movieText requestPageNumber : (NSUInteger)requestedPageNumber completionHander:(WebserviceCompletionHandler)completionHander
{
    if(![[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == NotReachable){
        NSString *movieSearchURL = kMovieSearchURLwithMovieName(movieText, requestedPageNumber);
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        [manager GET:movieSearchURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            completionHander(nil, responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
           [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            completionHander(err,nil);
        }];
    }
}
@end
