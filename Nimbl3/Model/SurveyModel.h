//
//  SurveyModel.h
//  Nimbl3
//
//  Created by Paulo Correa on 03/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SurveyModel : NSObject
@property (nonatomic, readonly) NSString *titleText;
@property (nonatomic, readonly) NSString *descriptionText;

- (instancetype)initWithText:(NSString *)text description:(NSString *)description imageURL:(NSString *)URL;
- (NSURL *)imageHighResolution;
@end
