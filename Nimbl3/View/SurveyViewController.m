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

static NSString * const NBsurveyCellIdentifier = @"CellIdentifier";
static CGFloat const NBpageControlTrailingMargin = 20.0f;

@interface SurveyViewController () <UITableViewDelegate, UIScrollViewDelegate>
@property (nonatomic, weak) SurveyViewModel *viewModel;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) TableViewDataSource *tableViewDataSource;
@property (nonatomic, strong) UIBarButtonItem *refreshButton;
@property (nonatomic, strong) UIBarButtonItem *loadingButton;
@property (nonatomic, strong) UIPageControl *pageControl;
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
        [cell.surveyButton addTarget:self action:@selector(pushNextView) forControlEvents:UIControlEventTouchUpInside];
        [cell.surveyImage setImageWithURL:survey.imageHighResolution];
    };
    
    self.tableViewDataSource = [[TableViewDataSource alloc] initCellIdentifier:NBsurveyCellIdentifier
                                                            configureCell:tableViewBlock];
    [self.tableView setDataSource:self.tableViewDataSource];
    [self.tableView setDelegate:self];
    [self.tableView registerClass:[SurveyTableViewCell class] forCellReuseIdentifier:NBsurveyCellIdentifier];
    self.tableView.backgroundColor = [UIColor blackColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection = NO;
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableview Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.view.frame.size.height - [UIApplication sharedApplication].statusBarFrame.size.height - self.navigationController.navigationBar.frame.size.height;
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageHeight = self.view.frame.size.height;
    self.pageControl.currentPage = ((self.tableView.contentOffset.y + pageHeight / 2) / pageHeight);
}

#pragma mark - Bind ViewModel
- (void)bindViewModel {
    @weakify(self)
    [RACObserve(self, viewModel.surveys) subscribeNext:^(id  _Nullable surveys) {
        @strongify(self);
        self.tableViewDataSource.arrItem = surveys;
        self.pageControl.numberOfPages = self.tableViewDataSource.arrItem.count;
        self.pageControl.currentPage = 0;
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
    
    self.pageControl = [UIPageControl new];
    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    self.pageControl.transform = CGAffineTransformMakeRotation(M_PI_2);
    [self.view addSubview:self.pageControl];
    
    self.refreshButton.tintColor = [UIColor whiteColor];
    self.title = @"SURVEYS";
}

- (void)updateViewConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.trailing.equalTo(self.view).with.offset(NBpageControlTrailingMargin);
    }];
    
    [super updateViewConstraints];
}
         
- (void)pushNextView {
    UIViewController *VC = [[UIViewController alloc] init];
    VC.view.backgroundColor = [UIColor whiteColor];
    VC.title = @":)";
    [self.navigationController pushViewController:VC animated:YES];
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

@end
