//
//  SurveyViewController.m
//  Nimbl3
//
//  Created by Paulo Correa on 03/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import "SurveyViewController.h"
#import "TableViewDataSource.h"
#import "SurveyTableViewCell.h"
#import "SurveyModel.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <Masonry/Masonry.h>

static NSString * const SurveyCellIdentifier = @"CellIdentifier";

@interface SurveyViewController () <UITableViewDelegate>
@property (nonatomic, weak) SurveyViewModel *viewModel;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) TableViewDataSource *tableViewDataSource;
@property (nonatomic, strong) UIBarButtonItem *refreshButton;
@property (nonatomic, strong) UIBarButtonItem *loadingButton;
@end

@implementation SurveyViewController

#pragma mark - Init
- (instancetype)initWithViewModel:(SurveyViewModel *)viewModel {
    self = [super init];
    if (self) {
        _viewModel = viewModel;
        _refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:nil action:nil];
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        [loadingView startAnimating];
        _loadingButton = [[UIBarButtonItem alloc] initWithCustomView:loadingView];
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return self;
}

#pragma mark - UITableView Datasource
- (void)setupTableView {
    TableViewBlock tableViewBlock = ^(SurveyTableViewCell *cell, SurveyModel *survey) {
        cell.surveyTitle.text = survey.titleText;
        cell.surveyDescription.text = survey.descriptionText;
        [cell.surveyImage setImageWithURL:survey.imageHighResolution];
    };
    
    self.tableViewDataSource = [[TableViewDataSource alloc] initCellIdentifier:SurveyCellIdentifier
                                                            configureCell:tableViewBlock];
    [self.tableView setDataSource:self.tableViewDataSource];
    [self.tableView setDelegate:self];
    [self.tableView registerClass:[SurveyTableViewCell class] forCellReuseIdentifier:SurveyCellIdentifier];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection = NO;
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableview Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.view.frame.size.height - [UIApplication sharedApplication].statusBarFrame.size.height - self.navigationController.navigationBar.frame.size.height;
}

#pragma mark - Bind ViewModel
- (void)bindViewModel {
    @weakify(self)
    [RACObserve(self, viewModel.surveys) subscribeNext:^(id  _Nullable surveys) {
        @strongify(self);
        self.tableViewDataSource.arrItem = surveys;
        [self.tableView reloadData];
    }];
    RAC(self, navigationItem.leftBarButtonItem) = [RACObserve(self, viewModel.isLoading) map:^id _Nullable(id  _Nullable loading) {
        @strongify(self);
        return [loading boolValue] ? self.loadingButton : self.refreshButton;
    }];
    
    RAC(self, refreshButton.rac_command) = RACObserve(self, viewModel.searchCommand);
}

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindViewModel];
    [self setupTableView];

    self.refreshButton.tintColor = [UIColor whiteColor];
    self.title = @"SURVEYS";
}

- (void)updateViewConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [super updateViewConstraints];
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

@end
