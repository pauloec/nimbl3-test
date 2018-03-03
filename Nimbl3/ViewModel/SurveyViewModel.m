//
//  SurveyViewModel.m
//  Nimbl3
//
//  Created by Paulo Correa on 03/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import "SurveyViewModel.h"
@interface SurveyViewModel ()
@property (nonatomic, readwrite) BOOL isLoading;
@property (nonatomic, copy) NSArray *surveys;
@end

@implementation SurveyViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _isLoading = NO;
        _surveys = [NSArray new];
        _refreshSurveyCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [self refreshSurveys];
        }];
    }
    return self;
}

- (RACSignal *)refreshSurveys {
    self.isLoading = YES;
    return [[RACSignal empty] logAll];
}

@end
