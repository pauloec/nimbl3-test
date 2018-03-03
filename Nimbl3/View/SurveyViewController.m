//
//  SurveyViewController.m
//  Nimbl3
//
//  Created by Paulo Correa on 03/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import "SurveyViewController.h"
#import <Masonry/Masonry.h>

@interface SurveyViewController ()
@property (nonatomic, weak) SurveyViewModel *viewModel;
@property (nonatomic, copy) NSArray *surveys;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIBarButtonItem *refreshButton;
@property (nonatomic, strong) UIBarButtonItem *loadingButton;
@end

@implementation SurveyViewController

#pragma mark - Init
- (instancetype)initWithViewModel:(SurveyViewModel *)viewModel {
    self = [super init];
    if (self ) {
        _viewModel = viewModel;
        _refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:nil action:nil];
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        [loadingView startAnimating];
        _loadingButton = [[UIBarButtonItem alloc] initWithCustomView:loadingView];
    }
    return self;
}

#pragma mark - Bind ViewModel
- (void)bindViewModel {
    @weakify(self)
    [RACObserve(self, viewModel.surveys) subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        self.surveys = x;
        [self.tableView reloadData];
    }];
    RAC(self, navigationItem.leftBarButtonItem) = [RACObserve(self, viewModel.isLoading) map:^id _Nullable(id  _Nullable loading) {
        @strongify(self);
        return [loading boolValue] ? self.loadingButton : self.refreshButton;
    }];
    
    RAC(self, refreshButton.rac_command) = RACObserve(self, viewModel.refreshSurveyCommand);
}

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindViewModel];

    self.refreshButton.tintColor = [UIColor whiteColor];
    self.title = @"SURVEYS";
}

- (void)updateViewConstraints {
    [super updateViewConstraints];
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

@end
