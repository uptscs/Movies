//
//  WebserviceOperation.h
//  Movies
//
//  Created by admin on 12/03/15.
//  Copyright (c) 2015 Upendra. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    WebServiceStatusFailure = 0,
    WebServiceStatusSuccess
}WebServiceStatus;

typedef void (^WebserviceCompletionHandler)(NSError* error, NSData *response);


@interface WebserviceOperation : NSObject
@property(nonatomic, assign)    WebserviceCompletionHandler completionHandler;

+(void)searchMovie: (NSString *)movieText requestPageNumber : (NSUInteger)requestedPageNumber completionHander:(WebserviceCompletionHandler)completionHander;

@end
