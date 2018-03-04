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
@property (nonatomic, weak) id<SurveyServiceProtocol> service;
@end

@implementation SurveyViewModel

- (instancetype)initWithService:(id<SurveyServiceProtocol>)service {
    self = [super init];
    if (self) {
        @weakify(self);
        _searchCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self);
            return [self requestSignal];
        }];
        _service = service;
        [RACObserve(self, service.hasAuth) subscribeNext:^(id  _Nullable x) {
            @strongify(self);
            [x boolValue] ? [self.searchCommand execute:nil] : nil;
        }];
        _isLoading = YES;
    }
    return self;
}

- (RACSignal *)requestSignal {
    RACSignal *requestSignal = [[self.service surveySearchService] surveySearchSignal];
    requestSignal = [requestSignal initially:^{
        self.isLoading = YES;
        self.surveys = @[];
    }];
    [requestSignal subscribeNext:^(id  _Nullable surveys) {
        self.surveys = surveys;
    }];
    requestSignal = [requestSignal finally:^{
        self.isLoading = NO;
    }];
    return requestSignal;
}

@end
