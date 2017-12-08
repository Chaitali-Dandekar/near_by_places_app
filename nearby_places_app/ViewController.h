//
//  ViewController.h
//  nearby_places_app
//
//  Created by Student-15 on 29/11/17.
//  Copyright (c) 2017 chaitali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreFoundation/CoreFoundation.h>
#import <MapKit/MapKit.h>

#import "tableViewController.h"

@interface ViewController : UIViewController<UITextFieldDelegate>
#define key @"AIzaSyD_afK8jdqhVAebXvTeq4y8dNDtLH1-yLM"
#define url @"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=18.5074,73.8077&rankby=distance&types=bank&key=AIzaSyCNGXB-B8BcxqPk4ZiTroFxtADfW2BFiuU"
@property (strong, nonatomic) IBOutlet UITextField *getLocation;
@property CGFloat lat1,lon1;
@property NSString *myKey;
@property NSMutableArray *place_type_array;
@property (strong, nonatomic) IBOutlet MKMapView *myMapView;
- (IBAction)NextButton:(UIButton *)sender;

@property NSArray *resultsArray, *namesArray, *vicinityPlaceArray;
@end

