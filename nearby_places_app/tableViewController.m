//
//  tableViewController.m
//  nearby_places_app
//
//  Created by Student-15 on 29/11/17.
//  Copyright (c) 2017 chaitali. All rights reserved.
//

#import "tableViewController.h"

@interface tableViewController ()

@end

@implementation tableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
//    self.namesArray1=[[NSArray alloc]init];
//    self.vicinityArray1=[[NSArray alloc]init];
    
    self.placeType_Array=[[NSArray alloc]initWithObjects:@"atm",@"bank",@"bus-station",@"doctor",@"hospital",@"park",@"taxi-stand",
    @"train_station",@"police",
    @"post-office", nil];
    
    
    
//    NSLog(@"on table view Controller \n\n %@\n%@",self.namesArray1,self.vicinityArray1);
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return  self.placeType_Array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"cell"];
    cell.textLabel.text=[self.placeType_Array objectAtIndex:indexPath.row];
//  cell.detailTextLabel.text=[self.vicinityArray1 objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(100, 200, 100, 60)];
//    label.text=cell.textLabel.text;
    
//    return cell;
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
//    tableViewController *tvc=[self.storyboard instantiateViewControllerWithIdentifier:@"tableViewController"];
    next1ViewController *nvc=[self.storyboard instantiateViewControllerWithIdentifier:@"next1ViewController"];
   
    NSString *str;
    str=cell.textLabel.text;
    nvc.type=str;
    nvc.lattitude=self.lat;
    nvc
    .longitude=self.lon;
     [self.navigationController pushViewController:nvc animated:YES];
    
    NSLog(@"%@",cell.textLabel.text);
    
    NSLog(@"text Field value is %@",nvc.textfield.text);
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

@end
