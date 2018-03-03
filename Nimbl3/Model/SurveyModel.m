//
//  SurveyModel.m
//  Nimbl3
//
//  Created by Paulo Correa on 03/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import "SurveyModel.h"

@interface SurveyModel ()
@property (nonatomic, readwrite) NSString *title;
@property (nonatomic, readwrite) NSString *descriptionText;
@property (nonatomic, readwrite) NSURL *imageURL;
@end

@implementation SurveyModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _title = @"SURVEY";
        _descriptionText = @"Description";
        _imageURL = [NSURL URLWithString:@"https://i.ytimg.com/vi/dQw4w9WgXcQ/maxresdefault.jpg"];
    }
    return self;
}

@end
