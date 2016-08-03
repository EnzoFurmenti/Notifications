//
//  Government.m
//  Notification
//
//  Created by EnzoF on 02.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "Government.h"
#import "AppDelegate.h"

NSString* const EFGovernmentTaxLevelDidChangeNotification = @"EFGovernmentTaxLevelDidChangeNotification";
NSString* const EFGovernmentSalaryDidChangeNotification = @"EFGovernmentSalaryDidChangeNotification";
NSString* const EFGovernmentPensionDidChangeNotification = @"EFGovernmentPensionDidChangeNotification";
NSString* const EFGovernmentAveragePriceDidChangeNotification = @"EFGovernmentAveragePriceDidChangeNotification";
NSString* const EFGovernmentInflationDidChangeNotification = @"EFGovernmentInflationDidChangeNotification";

NSString* const EFGovernmentTaxLevelUserInfoKey = @"EFGovernmentTaxLevelUserInfoKey";
NSString* const EFGovernmentSalaryUserInfoKey = @"EFGovernmentSalaryUserInfoKey";
NSString* const EFGovernmentPensionUserInfoKey = @"EFGovernmentPensionUserInfoKey";
NSString* const EFGovernmentAveragePriceUserInfoKey = @"EFGovernmentAveragePriceUserInfoKey";
NSString* const EFGovernmentInflationUserinfoKey = @"EFGovernmentInflationUserinfoKey";

@implementation Government


- (id)init
{
    self = [super init];
    if (self) {
        self.taxLevel = 5.f;
        self.salary = 1000;
        self.pension = 500;
        self.averagePrice = 10.f;
        self.inflation = 10.f;
        
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self  selector:@selector(didEnterBackgroundNotification:) name:UIApplicationDidEnterBackgroundNotification object:nil];
        
        [nc addObserver:self  selector:@selector(willEnterForegroundNotification:) name:UIApplicationWillEnterForegroundNotification object:nil];
    }
    return self;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma MARK -Notifications-
- (void) setTaxLevel:(CGFloat)taxLevel {
    _taxLevel = taxLevel;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel] forKey:EFGovernmentTaxLevelUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:EFGovernmentTaxLevelDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void) setSalary:(CGFloat)salary {
    _salary = salary;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary] forKey:EFGovernmentSalaryUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:EFGovernmentSalaryDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void) setPension:(CGFloat)pension {
    
    _pension = pension;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pension] forKey:EFGovernmentPensionUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:EFGovernmentPensionDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
    
}

- (void) setAveragePrice:(CGFloat)averagePrice {
    
    _averagePrice = averagePrice;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice] forKey:EFGovernmentAveragePriceUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:EFGovernmentAveragePriceDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
    
}

- (void) setInflation:(CGFloat)inflation {
    _inflation = inflation;
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:_inflation] forKey:EFGovernmentInflationUserinfoKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:EFGovernmentInflationDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}


- (void)didEnterBackgroundNotification:(NSNotification*) notification{
    NSLog(@"Government go to bed");
}

- (void)willEnterForegroundNotification:(NSNotification*) notification{
    NSLog(@"Government go from bed");
}


@end
