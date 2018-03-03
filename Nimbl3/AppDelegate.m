//
//  AppDelegate.m
//  Nimbl3
//
//  Created by Paulo Correa on 03/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import "AppDelegate.h"
#import "SurveyViewModel.h"
#import "SurveyViewController.h"

@interface AppDelegate ()
@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, strong) SurveyViewModel *viewModel;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.navigationController = [UINavigationController new];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0 green:5/255.f blue:35/255.f alpha:1.0]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    UIViewController *viewController = [self createInitialViewController];
    [self.navigationController pushViewController:viewController animated:NO];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (UIViewController *)createInitialViewController {
    self.viewModel = [SurveyViewModel new];
    return [[SurveyViewController alloc] initWithViewModel:self.viewModel];
}

@end
