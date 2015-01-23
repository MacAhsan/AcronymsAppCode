//
//  store.m
//  Testing
//
//  Created by Muhammad Ahsan on 5/5/14.
//
//

#import "store.h"

@implementation store

@synthesize meanings;

static store *sharedstore = nil;


+(store *)sharedstore
{
   @synchronized(self)
    {
        
       if(sharedstore == nil)
           
       {
           
           sharedstore = [[self alloc] init];
           
       }
        
        return sharedstore;
    }
    
    
}


@end
