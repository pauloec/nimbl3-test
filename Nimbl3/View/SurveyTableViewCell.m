//
//  SurveyTableViewCell.m
//  Nimbl3
//
//  Created by Paulo Correa on 03/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import "SurveyTableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import <Masonry/Masonry.h>

static CGFloat const NBsurveyTitleFontSize = 30.0f;
static CGFloat const NBsurveyTitleTopMargin = 100.0f;
static CGFloat const NBsurveyDescriptionFontSize = 20.0f;
static CGFloat const NBsurveyDescriptionTopMargin = 10.0f;
static CGFloat const NBtakeSurveyButtonFontSize = 20.0f;
static CGFloat const NBtakeSurveyButtonCornerRadius = 25.0f;
static CGFloat const NBtakeSurveyButtonHeight = 50.0f;
static CGFloat const NBtakeSurveyButtonBottomMargin = 100.0f;
static CGFloat const NBtakeSurveyButtonLeadingTrailingMargin = 70.0f;

@implementation SurveyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        self.surveyTitle = [UILabel new];
        self.surveyTitle.textColor = [UIColor whiteColor];
        self.surveyTitle.font = [UIFont boldSystemFontOfSize:NBsurveyTitleFontSize];
        self.surveyTitle.textAlignment = NSTextAlignmentCenter;
        self.surveyTitle.numberOfLines = 1;
        [self.contentView addSubview:self.surveyTitle];
        
        self.surveyDescription = [UILabel new];
        self.surveyDescription.textColor = [UIColor whiteColor];
        self.surveyDescription.font = [UIFont systemFontOfSize:NBsurveyDescriptionFontSize];
        self.surveyDescription.textAlignment = NSTextAlignmentCenter;
        self.surveyDescription.numberOfLines = 1;
        [self.contentView addSubview:self.surveyDescription];
        
        self.surveyImage = [UIImageView new];
        self.surveyImage.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.surveyImage];
        
        self.surveyButton = [UIButton new];
        [self.surveyButton setTitle:@"Take the Survey" forState:UIControlStateNormal];
        self.surveyButton.backgroundColor = [UIColor redColor];
        self.surveyButton.titleLabel.tintColor = [UIColor whiteColor];
        self.surveyButton.titleLabel.font = [UIFont systemFontOfSize:NBtakeSurveyButtonFontSize];
        self.surveyButton.layer.cornerRadius = NBtakeSurveyButtonCornerRadius;
        [self.contentView addSubview:self.surveyButton];
        
        self.contentView.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void)updateConstraints {
    [self.surveyTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(NBsurveyTitleTopMargin);
        make.centerX.equalTo(self.contentView);
    }];
    
    [self.surveyDescription mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.surveyTitle.mas_bottom).with.offset(NBsurveyDescriptionTopMargin);
        make.centerX.equalTo(self.contentView);
    }];
    
    [self.surveyImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    [self.surveyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView).with.offset(-NBtakeSurveyButtonBottomMargin);
        make.centerX.equalTo(self.contentView);
        make.leading.equalTo(self.contentView).with.offset(NBtakeSurveyButtonLeadingTrailingMargin);
        make.trailing.equalTo(self.contentView).with.offset(-NBtakeSurveyButtonLeadingTrailingMargin);
        make.height.mas_equalTo(NBtakeSurveyButtonHeight);
    }];
    
    [super updateConstraints];
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

@end
