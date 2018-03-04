//
//  SurveyModel.m
//  Nimbl3
//
//  Created by Paulo Correa on 03/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import "SurveyModel.h"

@interface SurveyModel ()
@property (nonatomic, readwrite) NSString *titleText;
@property (nonatomic, readwrite) NSString *descriptionText;
@property (nonatomic, readwrite) NSString *imageURL;
@end

@implementation SurveyModel

- (instancetype)initWithText:(NSString *)text description:(NSString *)description imageURL:(NSString *)URL {
    self = [super init];
    if (self) {
        _titleText = text;
        _descriptionText = description;
        _imageURL = URL;
    }
    return self;
}

- (NSURL *)imageHighResolution {
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@l", self.imageURL]];
}

@end
