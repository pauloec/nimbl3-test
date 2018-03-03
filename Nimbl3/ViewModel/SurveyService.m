//
//  SurveryService.m
//  Nimbl3
//
//  Created by Paulo Correa on 04/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import "SurveyService.h"
#import "SurveySearch.h"

@interface SurveyService ()
@property (strong, nonatomic) SurveySearch *searchService;
@end

@implementation SurveyService

- (instancetype)init {
    self = [super init];
    if (self) {
        _searchService = [SurveySearch new];
    }
    return self;
}

- (id<SurveySearchProtocol>)getSurveySearchService {
    return self.searchService;
}

@end
