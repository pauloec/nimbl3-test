//
//  SurveryService.m
//  Nimbl3
//
//  Created by Paulo Correa on 04/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import "SurveyService.h"
#import "SurveySearch.h"
#import <AFOAuth2Manager/AFOAuth2Manager.h>

static NSString * const serviceBaseURL = @"https://nimbl3-survey-api.herokuapp.com/";
static NSString * const serviceProviderIdentifier = @"Nimbl3";

@interface SurveyService ()
@property (nonatomic, strong) SurveySearch *searchService;
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, readwrite) BOOL hasAuth;
@end

@implementation SurveyService

- (instancetype)init {
    self = [super init];
    if (self) {
        _searchService = [SurveySearch new];
        _hasAuth = NO;
        [self requestToken];
    }
    return self;
}

- (id<SurveySearchProtocol>)surveySearchService {
    return self.searchService;
}

- (void)requestToken {
    NSURL *baseURL = [NSURL URLWithString:serviceBaseURL];
    AFOAuth2Manager *OAuth2Manager = [[AFOAuth2Manager alloc] initWithBaseURL:baseURL];
    [OAuth2Manager authenticateUsingOAuthWithURLString:@"/oauth/token"
                                              username:@"carlos@nimbl3.com"
                                              password:@"antikera"
                                                 scope:@""
                                               success:^(AFOAuthCredential *credential) {
                                                   NSLog(@"Token: %@", credential.accessToken);
                                                   self.manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
                                                   [self.manager.requestSerializer setAuthorizationHeaderFieldWithCredential:credential];
                                                   self.searchService.manager = self.manager;
                                                   self.hasAuth = YES;
                                                   [AFOAuthCredential storeCredential:credential withIdentifier:serviceProviderIdentifier];
                                               }
                                               failure:^(NSError *error) {
                                                   NSLog(@"Error: %@", error);
                                               }];
}

@end
