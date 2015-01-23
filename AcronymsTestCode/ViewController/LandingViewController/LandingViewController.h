//
//  ViewController.h
//  AcronymsTestCode
//
//  Created by MuhammadAhsan on 1/21/15.
//  Copyright (c) 2015 MuhammadAhsan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface LandingViewController : UIViewController <UITextFieldDelegate,MBProgressHUDDelegate>
{
    
    IBOutlet UITextField *WriteAcronym;
    
    
    
}

@property(nonatomic,retain)IBOutlet UITextField *WriteAcronym;

@end

