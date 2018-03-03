//
//  SurveyTableViewCell.m
//  Nimbl3
//
//  Created by Paulo Correa on 03/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import "SurveyTableViewCell.h"
#import <Masonry/Masonry.h>

static CGFloat const surveyTitleFontSize = 20.0f;
static CGFloat const surveyTitleTopMargin = 100.0f;
static CGFloat const surveyDescriptionFontSize = 14.0f;
static CGFloat const surveyDescriptionTopMargin = 10.0f;

@interface SurveyTableViewCell ()
@property (nonatomic, strong) UIButton *surveyButton;
@end

@implementation SurveyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        self.surveyTitle = [[UILabel alloc] init];
        self.surveyTitle.textColor = [UIColor blackColor];
        self.surveyTitle.font = [UIFont boldSystemFontOfSize:surveyTitleFontSize];
        self.surveyTitle.textAlignment = NSTextAlignmentCenter;
        self.surveyTitle.numberOfLines = 1;
        [self.contentView addSubview:self.surveyTitle];
        
        self.surveyDescription = [[UILabel alloc] init];
        self.surveyDescription.textColor = [UIColor blackColor];
        self.surveyDescription.font = [UIFont systemFontOfSize:surveyDescriptionFontSize];
        self.surveyDescription.textAlignment = NSTextAlignmentCenter;
        self.surveyDescription.numberOfLines = 1;
        [self.contentView addSubview:self.surveyDescription];
        
        self.surveyImage = [[UIImageView alloc] init];
        self.surveyImage.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.surveyImage];
    }
    return self;
}

- (void)updateConstraints {
    [self.surveyTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(surveyTitleTopMargin);
        make.centerX.equalTo(self.contentView);
    }];
    
    [self.surveyDescription mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.surveyTitle.mas_bottom).with.offset(surveyDescriptionTopMargin);
        make.centerX.equalTo(self.contentView);
    }];
    
    [self.surveyImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    [super updateConstraints];
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

@end
