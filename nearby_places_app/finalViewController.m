//
//  finalViewController.m
//  nearby_places_app
//
//  Created by Student-15 on 08/12/17.
//  Copyright (c) 2017 chaitali. All rights reserved.
//

#import "finalViewController.h"
#import "final2ViewController.h"
@interface finalViewController ()

@end

@implementation finalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"Names are:%@",self.names);
    NSLog(@"vicinity of:%@",self.vic);
    self.finalTableView.delegate=self;
    self.finalTableView.dataSource=self;
    [self.finalTableView reloadData];
    
//    [self.finalTableView registerClass: forCellReuseIdentifier:<#(NSString *)#>]
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.names.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"cell"];
    cell.backgroundColor=[UIColor grayColor];
    cell.textLabel.text=[self.names objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[self.vic objectAtIndex:indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    final2ViewController *fvc=[storyboard instantiateViewControllerWithIdentifier:@"final2ViewController"];
    fvc.string=cell.textLabel.text;
    fvc.str=cell.detailTextLabel.text;
    [self.navigationController pushViewController:fvc animated:YES];
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
