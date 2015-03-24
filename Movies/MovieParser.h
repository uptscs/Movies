//
//  MovieParser.h
//  Movies
//
//  Created by admin on 13/03/15.
//  Copyright (c) 2015 Upendra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieParser : NSObject

+(NSUInteger)totalMovieCount : (id)responseData;
+(NSArray *)movieListParser : (NSData *)responseData;

@end
