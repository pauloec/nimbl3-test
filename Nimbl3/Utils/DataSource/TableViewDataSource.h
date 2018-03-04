//
//  TableViewDataSource.h
//  Nimbl3
//
//  Created by Paulo Correa on 04/03/18.
//  Copyright © 2018 Paulo Correa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^TableViewBlock)(id cell, id item);

@interface TableViewDataSource : NSObject <UITableViewDataSource>
- (instancetype)initCellIdentifier:(NSString *)cellIdentifier configureCell:(TableViewBlock)cellBlock;
@property (nonatomic, copy) NSArray *arrItem;
@end
