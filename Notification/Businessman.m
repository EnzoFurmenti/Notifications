//
//  Businessman.m
//  Notification
//
//  Created by EnzoF on 02.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "Businessman.h"
#import "Government.h"
#import "AppDelegate.h"
//#import "AppDelegate.h"

@implementation Businessman

- (id)init
{
    self = [super init];
    if (self)
    {
        
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(taxLevelChangedNotification:)
                   name:EFGovernmentTaxLevelDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(averagePriceChangedNotification:)
                   name:EFGovernmentAveragePriceDidChangeNotification
                 object:nil];
        [nc addObserver:self selector:@selector(inflationDidChangeNotification:) name:EFGovernmentInflationDidChangeNotification object:nil];
        
        [nc addObserver:self  selector:@selector(didEnterBackgroundNotification:) name:UIApplicationDidEnterBackgroundNotification object:nil];
        
         [nc addObserver:self  selector:@selector(willEnterForegroundNotification:) name:UIApplicationWillEnterForegroundNotification object:nil];
        
        self.profitInPercent = 100.f;
    }
    return self;
}

- (void) dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

#pragma mark - Notifications

- (void) taxLevelChangedNotification:(NSNotification*) notification {
    
    NSNumber* value = [notification.userInfo objectForKey:EFGovernmentTaxLevelUserInfoKey];
    
    CGFloat taxLevel = [value floatValue];
    
    if (taxLevel > self.taxLevel) {
        NSLog(@"Businessmen are NOT happy for taxLevel");
    } else
    
    {
        NSLog(@"Businessmen are happy for taxLevel");
    }
    
    self.taxLevel = taxLevel;
    self.profitInPercent = taxLevel - self.taxLevel;
}

- (void) averagePriceChangedNotification:(NSNotification*) notification {
    
    NSNumber* value = [notification.userInfo objectForKey:EFGovernmentAveragePriceUserInfoKey];
    
    CGFloat averagePrice = [value floatValue];
    
    if (averagePrice < self.averagePrice) {
        NSLog(@"Businessmen are NOT happy for averagePrice");
    } else {
        NSLog(@"Businessmen are happy for averagePrice");
    }
    
    self.averagePrice = averagePrice;
    
}

- (void)inflationDidChangeNotification:(NSNotification*) notification{
    
    NSNumber* value = [notification.userInfo objectForKey:EFGovernmentInflationUserinfoKey];
    CGFloat inflation = [value floatValue];
    if(inflation > self.profitInPercent)
    {
        NSLog(@"Businessman are NOT happy for inflation");
    }
    else
    {
        NSLog(@"Businessman are happy for inflation");
    }
}

- (void)didEnterBackgroundNotification:(NSNotification*) notification{
    NSLog(@"Businessman go to bed");
}

- (void)willEnterForegroundNotification:(NSNotification*) notification{
    NSLog(@"Businessman go from bed");
}


@end
