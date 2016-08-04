//
//  MyAppDelegate.m
//  Notification
//
//  Created by EnzoF on 03.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "MyAppDelegate.h"

@implementation MyAppDelegate

- (id)init{
    self = [super init];
    if (self)
    {
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self selector:@selector(didEnterBackgroundNotification:) name:UIApplicationDidEnterBackgroundNotification object:nil];
        
        [nc addObserver:self selector:@selector(willEnterForegroundNotification:) name:UIApplicationWillEnterForegroundNotification object:nil];
        
        [nc addObserver:self selector:@selector(didFinishLaunchingNotification:) name:UIApplicationDidFinishLaunchingNotification object:nil];
        
        
        [nc addObserver:self selector:@selector(didBecomeActiveNotification:) name:UIApplicationDidBecomeActiveNotification object:nil];
        
        [nc addObserver:self selector:@selector(willResignActiveNotification:) name:UIApplicationWillResignActiveNotification object:nil];
        
        
        [nc addObserver:self selector:@selector(willTerminateNotification:) name:UIApplicationWillTerminateNotification object:nil];
        

    }
    
    return self;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma MARK -Notification

- (void)didEnterBackgroundNotification:(NSNotification*)notifiation{
    
    NSLog(@"MyAppDelegate - didEnterBackgroundNotification");
    
}
- (void)willEnterForegroundNotification:(NSNotification*)notifiation{
    NSLog(@"MyAppDelegate - willEnterForegroundNotification");
    
}

- (void)didFinishLaunchingNotification:(NSNotification*)notifiation{
    NSLog(@"MyAppDelegate - didFinishLaunchingNotification");
    
}

- (void)didBecomeActiveNotification:(NSNotification*)notifiation{
    NSLog(@"MyAppDelegate - didBecomeActiveNotification");
}

- (void)willResignActiveNotification:(NSNotification*)notifiation{
    NSLog(@"MyAppDelegate - willResignActiveNotification");
}


- (void)willTerminateNotification:(NSNotification*)notifiation{
    NSLog(@"MyAppDelegate - willTerminateNotification");
}
@end
