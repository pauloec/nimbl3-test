//
//  TableViewDataSource.m
//  Nimbl3
//
//  Created by Paulo Correa on 04/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import "TableViewDataSource.h"

@interface TableViewDataSource ()
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewBlock cellBlock;
@end

@implementation TableViewDataSource

- (instancetype)init {
    return nil;
}

- (instancetype)initCellIdentifier:(NSString *)cellIdentifier configureCell:(TableViewBlock)cellBlock {
    self = [super init];
    if (self) {
        self.cellIdentifier = cellIdentifier;
        self.cellBlock = cellBlock;
        self.arrItem = [NSArray new];
    }
    
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.arrItem[(NSUInteger) indexPath.row];
}

#pragma mark - UITableView Data Source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrItem.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    
    id item = [self itemAtIndexPath:indexPath];
    self.cellBlock(cell, item);
    return cell;
}

@end
