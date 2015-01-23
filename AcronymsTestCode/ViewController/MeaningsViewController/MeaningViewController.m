//
//  MeaningViewController.m
//  AcronymsTestCode
//
//  Created by MuhammadAhsan on 1/21/15.
//  Copyright (c) 2015 MuhammadAhsan. All rights reserved.
//

#import "MeaningViewController.h"
#import "store.h"

@interface MeaningViewController ()

@end

@implementation MeaningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}

#pragma mark Tableview


// the hight of each cell/row in the table view

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


// Assigning values in tableview and putting json response

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //initialize singleton

    store *mystore = [store sharedstore];
    
    NSString* CellIdentifier = [NSString stringWithFormat:@"Cell%d",indexPath.row];
    UITableViewCell *cell = (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                  reuseIdentifier:CellIdentifier];
    
    
    
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.textLabel.numberOfLines=0;
    [cell.textLabel sizeToFit];
    cell.textLabel.text = [mystore.meanings objectAtIndex:indexPath.row]; // singleton array is providing text
    
    
 
    return cell;
    
    
    
    
}


-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section
{
    
    
    store *mystore = [store sharedstore];
    
    return [mystore.meanings count];
    
    
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
