//
//  SurveySearch.h
//  Nimbl3
//
//  Created by Paulo Correa on 04/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import "SurveySearchProtocol.h"
#import <AFNetworking/AFNetworking.h>
#import <Foundation/Foundation.h>

@interface SurveySearch : NSObject <SurveySearchProtocol>
@property (nonatomic, weak) AFHTTPSessionManager *manager;
@end
