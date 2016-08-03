//
//  Businessman.h
//  Notification
//
//  Created by EnzoF on 02.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

@interface Businessman : NSObject

@property(nonatomic,assign) CGFloat taxLevel;
@property (nonatomic, assign) CGFloat averagePrice;
@property (nonatomic, assign) CGFloat profitInPercent;

@end
