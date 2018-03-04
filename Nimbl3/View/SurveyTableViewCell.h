//
//  SurveyTableViewCell.h
//  Nimbl3
//
//  Created by Paulo Correa on 03/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SurveyTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *surveyTitle;
@property (nonatomic, strong) UILabel *surveyDescription;
@property (nonatomic, strong) UIImageView *surveyImage;
@property (nonatomic, strong) UIButton *surveyButton;
@end
