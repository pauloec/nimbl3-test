//
//  SurveyViewModel.h
//  Nimbl3
//
//  Created by Paulo Correa on 03/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import "SurveyServiceProtocol.h"
#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface SurveyViewModel : NSObject
@property (nonatomic, readonly) BOOL isLoading;
@property (nonatomic, copy) NSArray *surveys;
@property (nonatomic, readonly) RACCommand *searchCommand;

- (instancetype)initWithService:(id<SurveyServiceProtocol>)service;
@end
