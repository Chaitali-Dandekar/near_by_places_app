//
//  ViewController.m
//  nearby_places_app
//
//  Created by Student-15 on 29/11/17.
//  Copyright (c) 2017 chaitali. All rights reserved.
//

#import "ViewController.h"
#import "tableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myKey=key;
     _getLocation.delegate=self;
   
    

    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    
    NSString *location=_getLocation.text;
    
    
    CLGeocoder *geocoder=[[CLGeocoder alloc]init];
    
    [geocoder geocodeAddressString:location completionHandler:^(NSArray *placemarks, NSError *error)
     
     {
         
         
         
         if (placemarks && placemarks.count>0)
             
         {
             
             CLPlacemark *topresult=[placemarks objectAtIndex:0];
             
             MKPlacemark *placemark=[[MKPlacemark alloc]initWithPlacemark:topresult];
             
             MKCoordinateRegion region=_myMapView.region;
             
             region.center=placemark.region.center;
             
             region.span.longitudeDelta/=8.0;
             
             region.span.latitudeDelta/=8.0;
             
             [self.myMapView setRegion:region animated:YES];
             
             [self.myMapView addAnnotation:placemark];
             
             
             
             self.lat1=region.center.latitude;
             
             self.lon1=region.center.longitude;
             
              NSLog(@"lat:%f lon:%f",self.lat1,self.lon1);
             
     [self getLocationDetailWithLatitude:self.lat1 andWithLongitude:self.lon1 andWithKey:self.myKey];
             
//             [self parseData];
             
         }
         
     }];
    return YES;
}
-(void)getLocationDetailWithLatitude:(float)lat1 andWithLongitude:(float)lon1 andWithKey:(NSString *)newKey



{
    
    
    
//    NSString *str=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&rankby=distance&key=%@",self.lat1,self.lon1,key];
    
    NSString *str=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&rankby=distance&key=AIzaSyD_afK8jdqhVAebXvTeq4y8dNDtLH1-yLM",self.lat1,self.lon1];

    
    NSLog(@"Search Term in Browser: %@",str);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)parseData
//
//{
//     NSString *str=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&rankby=distance&key=%@",self.lat1,self.lon1,key];
////    NSString *str=@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&rankby=distance&key=AIzaSyD_afK8jdqhVAebXvTeq4y8dNDtLH1-yLM";
//    
//    NSURL *myurl=[NSURL URLWithString:str];
//    
//    NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    
//    NSURLSessionDataTask *dataTask=[session dataTaskWithURL:myurl completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        
//    NSHTTPURLResponse *myresponse=(NSHTTPURLResponse *)response;
//        
//        if (myresponse.statusCode==200)
//        {
//            if (data)
//            { NSLog(@"Data Found");
//            NSLog(@"Data is: %@",response);
//                //following code is imp
//               NSDictionary *myDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
//                
//                if (error)
//                    {
//                  NSLog(@"Error:%@",error.localizedDescription);
//              }
//             else
//            {
//            NSLog(@"\n\nMain Dict is:\n\n\n%@",myDic);
//                    
//                self.resultsArray=[myDic valueForKey:@"results"];
//                NSLog(@"\n\n\nRESULT ARRAY IS:%@",self.resultsArray);
//                
//                self.namesArray=[self.resultsArray valueForKey:@"name"];
//                NSLog(@"THE NAMES ARRAY IS:%@",self.namesArray);
//                
//                self.vicinityPlaceArray=[self.resultsArray valueForKey:@"vicinity"];
//                NSLog(@"THE VICINITY PLACES ARRAY IS:%@",self.vicinityPlaceArray);
//                
//                
//                
//                
//                
////                _results=[myarray valueForKey:@"results"];
//                
//                    //
//                    
//                   
//                    
//                    // NSString *u=[_d4 objectForKey:@"description"];
//                    
//                    // _Description.text=u;
//                    
//                    
//                    
//                    
//                                      //                    _country=[_results valueForKey:@"country"];
//                    
                    //
                    
                    //                    NSLog(@"The countries are:%@",_country);
                    
                    //                    
                    
                    //                    _country=[_results valueForKey:@"isocode"];
                    
                    //                    
                    
                    //                    NSLog(@"The iso codes are:%@",_country);
                    
                    
//                    
//                }
//               }
//           else
//          { NSLog(@"Data Not Found");
//         }
//       }
//      else
//        { NSLog(@"Response not Found");
//        }
//     }];
//    [dataTask resume];
//    
//}

- (IBAction)NextButton:(UIButton *)sender
{
    tableViewController *tvc=[self.storyboard instantiateViewControllerWithIdentifier:@"tableViewController"];
    tvc.lat=self.lat1;
    tvc.lon=self.lon1;
//    tvc.namesArray1=[[NSArray alloc]init];
//    tvc.namesArray1=self.namesArray;
//    tvc.vicinityArray1=[[NSArray alloc]init];
//
//    tvc.vicinityArray1=self.vicinityPlaceArray;
//    NSLog(@"Passed on tableViewController: \n\n %@ %@",tvc.namesArray1,tvc.vicinityArray1);
    [self.navigationController pushViewController:tvc animated:YES];

}


//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    tableViewController *tvc=[[tableViewController alloc]init];
//    tvc.namesArray1=[[NSArray alloc]init];
//    tvc.namesArray1=self.namesArray;
//    tvc.vicinityArray1=[[NSArray alloc]init];
//    
//    tvc.vicinityArray1=self.vicinityPlaceArray;
//}

@end
