//
//  ScramblerAppDelegate.h
//  Scrambler
//
//  Created by user  on 3/31/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ScramblerViewController;

@interface ScramblerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ScramblerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ScramblerViewController *viewController;

@end

