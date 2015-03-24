//
//  ViewController.h
//  Movies
//
//  Created by admin on 12/03/15.
//  Copyright (c) 2015 Upendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MNMBottomPullToRefreshManager.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate,MNMBottomPullToRefreshManagerClient>

@property(nonatomic, strong) NSString *movieSearchString;

@end

