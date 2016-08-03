//
//  Government.h
//  Notification
//
//  Created by EnzoF on 02.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreGraphics/CGBase.h>

extern NSString* const EFGovernmentTaxLevelDidChangeNotification;
extern NSString* const EFGovernmentSalaryDidChangeNotification;
extern NSString* const EFGovernmentPensionDidChangeNotification;
extern NSString* const EFGovernmentAveragePriceDidChangeNotification;
extern NSString* const EFGovernmentInflationDidChangeNotification;

extern NSString* const EFGovernmentTaxLevelUserInfoKey;
extern NSString* const EFGovernmentSalaryUserInfoKey;
extern NSString* const EFGovernmentPensionUserInfoKey;
extern NSString* const EFGovernmentAveragePriceUserInfoKey;

extern NSString* const EFGovernmentInflationUserinfoKey;


@interface Government : NSObject

@property (assign, nonatomic) CGFloat taxLevel;
@property (assign, nonatomic) CGFloat salary;
@property (assign, nonatomic) CGFloat pension;
@property (assign, nonatomic) CGFloat averagePrice;
@property (assign, nonatomic) CGFloat inflation;

@end
