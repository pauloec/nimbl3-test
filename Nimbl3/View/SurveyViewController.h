//
//  SurveyViewController.h
//  Nimbl3
//
//  Created by Paulo Correa on 03/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SurveyViewModel.h"

@interface SurveyViewController : UIViewController

- (instancetype)initWithViewModel:(SurveyViewModel *)viewModel;

@end
