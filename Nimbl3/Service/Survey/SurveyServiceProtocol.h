//
//  SurveyServiceProtocol.h
//  Nimbl3
//
//  Created by Paulo Correa on 04/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import "SurveySearchProtocol.h"
#import <Foundation/Foundation.h>

@protocol SurveyServiceProtocol <NSObject>
@property (nonatomic, readonly) BOOL hasAuth; // Shouldn't exist!!
- (id<SurveySearchProtocol>)surveySearchService;
@end
