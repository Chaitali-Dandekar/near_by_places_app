//
//  tableViewController.h
//  nearby_places_app
//
//  Created by Student-15 on 29/11/17.
//  Copyright (c) 2017 chaitali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "next1ViewController.h"
@interface tableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property CGFloat lat, lon;
@property NSArray *placeType_Array;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property NSArray *namesArray1, *vicinityArray1;

@end
