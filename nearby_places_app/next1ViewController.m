//
//  next1ViewController.m
//  nearby_places_app
//
//  Created by Student-15 on 30/11/17.
//  Copyright (c) 2017 chaitali. All rights reserved.
//

#import "next1ViewController.h"
#import "finalViewController.h"
@interface next1ViewController ()

@end

@implementation next1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"val is %@",self.type);
    self.textfield.text=self.type;
    [self parseData];
}

-(void)getLocationDetailWithLatitude:(float)lat1 andWithLongitude:(float)lon1 andWithKey:(NSString *)newKey



{
    //    NSString *str=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&rankby=distance&key=%@",self.lat1,self.lon1,key];
    
    NSString *str=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&rankby=distance&types=%@&key=AIzaSyD_afK8jdqhVAebXvTeq4y8dNDtLH1-yLM",self.lattitude,self.longitude,self.type];
    

    
    
    NSLog(@"Search Term in Browser: %@",str);
    
}


-(void)parseData

{
    NSString *str=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&rankby=distance&types=%@&key=AIzaSyD_afK8jdqhVAebXvTeq4y8dNDtLH1-yLM",self.lattitude,self.longitude,self.type];
    
    
//    https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=18.5074,73.8077&rankby=distance&types=bank&key=AIzaSyCNGXB-B8BcxqPk4ZiTroFxtADfW2BFiuU
    //    NSString *str=@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&rankby=distance&key=AIzaSyD_afK8jdqhVAebXvTeq4y8dNDtLH1-yLM";
    
    NSURL *myurl=[NSURL URLWithString:str];
    
    NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *dataTask=[session dataTaskWithURL:myurl completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSHTTPURLResponse *myresponse=(NSHTTPURLResponse *)response;
        
        if (myresponse.statusCode==200)
        {
            if (data)
            { NSLog(@"Data Found");
                NSLog(@"Data is: %@",response);
                //following code is imp
                NSDictionary *myDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                
                if (error)
                {
                    NSLog(@"Error:%@",error.localizedDescription);
                }
                else
                {
                    NSLog(@"\n\nMain Dict is:\n\n\n%@",myDic);
                    
                    self.resultsArray=[myDic valueForKey:@"results"];
                    NSLog(@"\n\n\nRESULT ARRAY IS:%@",self.resultsArray);
                    
                    self.PlaceNamesArray=[self.resultsArray valueForKey:@"name"];
                    NSLog(@"THE Place NAMES ARRAY IS:%@",self.PlaceNamesArray);
                    
                    self.VicinityArray=[self.resultsArray valueForKey:@"vicinity"];
                    NSLog(@"THE VICINITY PLACES ARRAY IS:%@",self.VicinityArray);
                    
                    self.ratingsArray=[self.ratingsArray valueForKey:@"rating"];
                    NSLog(@"the Rating array is:%@",self.ratingsArray);
                    
                    
                    
                    
//                                    _results=[myarray valueForKey:@"results"];
                    
                    
                    
                    
                    
                    // NSString *u=[_d4 objectForKey:@"description"];
                    
                    // _Description.text=u;
                    
                    
                    
                    
                    //                    _country=[_results valueForKey:@"country"];
                    
                    //
                    
                    //                    NSLog(@"The countries are:%@",_country);
                    
                    //
                    
                    //                    _country=[_results valueForKey:@"isocode"];
                    
                    //
                    
                    //                    NSLog(@"The iso codes are:%@",_country);
//                    finalViewController *finalVC=[[finalViewController alloc]init];
//                    finalVC.names=self.PlaceNamesArray;
//                    finalVC.vic=self.VicinityArray;
//
                    
                    
                    
                }
            }
            else
            { NSLog(@"Data Not Found");
            }
        }
        else
        { NSLog(@"Response not Found");
        }
    }];
    [dataTask resume];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




- (IBAction)nextButton:(id)sender
{
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    finalViewController *finalVC=[storyboard instantiateViewControllerWithIdentifier:@"finalViewController"];
    finalVC.names=self.PlaceNamesArray;
    finalVC.vic=self.VicinityArray;
    NSLog(@"finalVC.names=%@ & finalVC.vic=%@",finalVC.names,    finalVC.vic);
    
    [self.navigationController pushViewController:finalVC animated:YES];
    
    
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    finalViewController *finalVC=[[finalViewController alloc]init];
//    finalVC.names=self.PlaceNamesArray;
//    finalVC.vic=self.VicinityArray;
//    [self.navigationController pushViewController:finalVC animated:YES];
//    
//
//    
//}
@end
