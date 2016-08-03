//
//  Doctor.m
//  Notification
//
//  Created by EnzoF on 02.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "Doctor.h"

#import "Government.h"
#import "AppDelegate.h"

@implementation Doctor

#pragma mark - Initialization

- (id)init
{
    self = [super init];
    if (self) {
        
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(salaryChangedNotification:)
                   name:EFGovernmentSalaryDidChangeNotification
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

- (void)salaryChangedNotification:(NSNotification*) notification {
    
    NSNumber* value = [notification.userInfo objectForKey:EFGovernmentSalaryUserInfoKey];
    
    CGFloat salary = [value floatValue];
    
    if (salary < self.salary) {
        NSLog(@"Doctors are NOT happy for salary");
    } else {
        NSLog(@"Doctors are happy for salary");
    }
    
    self.profitInPercent = (self.salary - salary)/100;
    
    self.salary = salary;
}

- (void)averagePriceChangedNotification:(NSNotification*) notification {
    
    NSNumber* value = [notification.userInfo objectForKey:EFGovernmentAveragePriceUserInfoKey];
    
    CGFloat averagePrice = [value floatValue];
    
    if (averagePrice > self.averagePrice) {
        NSLog(@"Doctors are NOT happy for averagePrice");
    } else {
        NSLog(@"Doctors are happy for averagePrice");
    }
    
    self.averagePrice = averagePrice;
}

- (void)inflationDidChangeNotification:(NSNotification*) notification{
    
    NSNumber* value = [notification.userInfo objectForKey:EFGovernmentInflationUserinfoKey];
    CGFloat inflation = [value floatValue];
    if(inflation > self.profitInPercent)
    {
        NSLog(@"Doctors are NOT happy for inflation");
    }
    else
    {
        NSLog(@"Doctors are happy for inflation");
    }
}

- (void)didEnterBackgroundNotification:(NSNotification*) notification{
    NSLog(@"Doctors go to bed");
}

- (void)willEnterForegroundNotification:(NSNotification*) notification{
    NSLog(@"Doctors go from bed");
}


@end
