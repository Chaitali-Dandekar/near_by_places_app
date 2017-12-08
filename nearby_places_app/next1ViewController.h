//
//  next1ViewController.h
//  nearby_places_app
//
//  Created by Student-15 on 30/11/17.
//  Copyright (c) 2017 chaitali. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface next1ViewController : UIViewController
@property NSString *type;
@property (strong, nonatomic) IBOutlet UITextField *textfield;
@property CGFloat lattitude,longitude;
@property NSArray *resultsArray, *PlaceNamesArray, *VicinityArray, *ratingsArray;
- (IBAction)nextButton:(id)sender;



@end
