//
//  finalViewController.h
//  nearby_places_app
//
//  Created by Student-15 on 08/12/17.
//  Copyright (c) 2017 chaitali. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface finalViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *finalTableView;

@property NSArray *names, *vic;

@end
