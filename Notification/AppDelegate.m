//
//  AppDelegate.m
//  Notification
//
//  Created by EnzoF on 02.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "AppDelegate.h"
#import "Government.h"
#import "Businessman.h"
#import "Doctor.h"
#import "Pensionary.h"
#import "ViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) Government *government;
@property (nonatomic, strong) Businessman *businessman;
@property (nonatomic, strong) Doctor *doctor;
@property (nonatomic, strong) Pensionary *pensionary;


@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor orangeColor];
    [self.window makeKeyAndVisible];
    
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = navC;
    
    self.government = [[Government alloc] init];
    
    self.businessman = [[Businessman alloc]init];
    self.businessman.taxLevel = 3.f;
    self.businessman.averagePrice = 5.f;
    
    self.doctor = [[Doctor alloc] init];
    self.doctor.salary = 200.f;
    self.doctor.averagePrice = 20.f;
    
    self.pensionary = [[Pensionary alloc] init];
    self.pensionary.pension = 7.f;
    self.pensionary.averagePrice = 9.f;
    
    self.government.salary = 350.f;
    self.government.pension = 10.f;
    self.government.taxLevel = 5.f;
    self.government.averagePrice = 9.f;
    self.government.inflation = 20.f;
    
    // Override point for customization after application launch.
    return YES;
}



@end
