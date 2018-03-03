//
//  SurveySearchProtocol.h
//  Nimbl3
//
//  Created by Paulo Correa on 04/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

@protocol SurveySearchProtocol <NSObject>
- (RACSignal *)surveySearchSignal;
@end
