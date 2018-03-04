//
//  SurveySearch.m
//  Nimbl3
//
//  Created by Paulo Correa on 04/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import "SurveySearch.h"
#import "SurveyModel.h"
#import <ReactiveObjC/ReactiveObjC.h>

@implementation SurveySearch

- (RACSignal *)surveySearchSignal {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id  subscriber) {
        [self.manager GET:@"/surveys.json"
               parameters:nil
                 progress:nil
                  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                      NSMutableArray *surveys = [NSMutableArray new];
                      for (NSDictionary *survey in responseObject) {
                          SurveyModel *surveyModel = [[SurveyModel alloc] initWithText:[survey objectForKey:@"title"]
                                                                           description:[survey objectForKey:@"description"]
                                                                              imageURL:[survey objectForKey:@"cover_image_url"]];
                          [surveys addObject:surveyModel];
                      }
                      
                      [subscriber sendNext:[surveys copy]];
                      [subscriber sendCompleted];
                  }
                  failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                      NSLog(@"Failure: %@", error);
                      [subscriber sendCompleted];
                  }];
        return nil;
    }];
    return signal;
}

@end
