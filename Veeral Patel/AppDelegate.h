//
//  AppDelegate.h
//  AboutMe
//
//  Created by Veeral Patel on 4/24/13.
//  Copyright (c) 2013 Veeral Patel. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InfoViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    InfoViewController *rootView;

}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) InfoViewController *rootView;

@end

