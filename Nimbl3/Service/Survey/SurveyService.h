//
//  SurveryService.h
//  Nimbl3
//
//  Created by Paulo Correa on 04/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import "SurveyServiceProtocol.h"
#import <AFNetworking/AFNetworking.h>
#import <Foundation/Foundation.h>

@interface SurveyService : NSObject <SurveyServiceProtocol>
@property (nonatomic, readonly) BOOL hasAuth;
@end
