//
//  SurveyViewModel.m
//  Nimbl3
//
//  Created by Paulo Correa on 03/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import "SurveyViewModel.h"
#import "SurveyModel.h"

@interface SurveyViewModel ()
@property (nonatomic, readwrite) BOOL isLoading;
@property (nonatomic, copy) NSArray *surveys;
@property (nonatomic, weak) id<SurveyServiceProtocol> service;
@end

@implementation SurveyViewModel

- (instancetype)initWithService:(id<SurveyServiceProtocol>)service {
    self = [super init];
    if (self) {
        _isLoading = NO;
        _refreshSurveyCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [[self.service getSurveySearchService] surveySearchSignal];
        }];
        _service = service;
    }
    return self;
}

@end
