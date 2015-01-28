//
//  LandingViewController.m
//  AcronymsTestCode
//
//  Created by MuhammadAhsan on 1/21/15.
//  Copyright (c) 2015 MuhammadAhsan. All rights reserved.
//



#import "LandingViewController.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPSessionManager.h"
#import "AFHTTPRequestOperationManager.h"
#import "store.h"
#import "MeaningViewController.h"
#import "MBProgressHUD.h"
#import <unistd.h>

@interface LandingViewController  () <MBProgressHUDDelegate> {
    MBProgressHUD *HUD;
    long long expectedLength;
    long long currentLength;
}


@end

@implementation LandingViewController

@synthesize WriteAcronym;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   // [self search:self];
    
   
}



- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    NSLog(@"begin editing");
    
    return YES;
}

//Tells the delegate that editing began for the specified text field.
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    
      NSLog(@"begin editing1 %@" ,textField.text);
    //self.myLabel.text = [NSString stringWithFormat:@"Begin editing Text field %i", i];
    
    
    
}

//Asks the delegate if editing should stop in the specified text field.
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
      NSLog(@"fiish editing %@" ,textField.text);
  
    return YES;
}

//Tells the delegate that editing stopped for the specified text field.
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    
    
      NSLog(@"fiishhh editing%@" ,textField.text);
    
    
}


#pragma mark Search/Fetch Meanings

//This functions fetch meanings of the acronym typed in uitextfield.

-(void)search
{
    
    
    store *mystore = [store sharedstore];
    mystore.meanings = [[NSMutableArray alloc]init];
    
    NSString *HOST = WriteAcronym.text;
    AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
    [securityPolicy setAllowInvalidCertificates:YES];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setSecurityPolicy:securityPolicy];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:[NSString stringWithFormat:@"http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=%@", HOST] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         
         NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];//
         
         
         if ([json isKindOfClass:[NSArray class]])
             
         {
             
             
             NSArray *jsonArray = (NSArray *)json;
             
             
             
             NSString *lfs = [[jsonArray objectAtIndex:0] objectForKey:@"lfs"];
             
             
             
             
             NSArray *jsonArray1 = (NSArray *)lfs;
             
             
             for(int i=0; i<[jsonArray1 count]; i++)
             {
                 
                 NSString *lf = [[jsonArray1 objectAtIndex:i] objectForKey:@"lf"];
                 
                 
                 [mystore.meanings addObject:lf];
                 
             }
             
             
             // Moving to next Viewcontroller
             
             NSString * storyboardName = @"Main";
             UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: [NSBundle mainBundle]];
             UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"find"];
             [self presentViewController:vc animated:YES completion:nil];
             
             
             
         }
         
         
         //Checking the output exception
         else
             
         {
             NSLog(@"its probably a dictionary");
             NSDictionary *jsonDictionary = (NSDictionary *)json;
             NSLog(@"jsonDictionary - %@",jsonDictionary);
             
         }
         
         
         
         
         
         
         
         
     }
     
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
   
    
   
    
}



// When find button is clicked this function will show progress and search the meanings.

    
-(IBAction)Find:(id)sender
{
   
  HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    
    HUD.delegate = self;
    HUD.labelText = @"Loading";
    
    [HUD showWhileExecuting:@selector(HUdProgress) onTarget:self withObject:nil animated:YES];
   
    [self search];



}

#pragma mark HUD

- (void)HUdProgress {
    //Sleeps till the information got fetched from webservice
    sleep(4);
    
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
