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
- (id<SurveySearchProtocol>)getSurveySearchService;
@end
