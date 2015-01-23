//
//  store.h
//  Testing
//
//  Created by Muhammad Ahsan on 5/5/14.
//
//

#import <Foundation/Foundation.h>

@interface store : NSObject

{
    
#pragma mark Heviwate
    
    NSMutableArray *meanings;
    
}

@property(nonatomic,retain)NSMutableArray *meanings;



+(store *)sharedstore;

@end
