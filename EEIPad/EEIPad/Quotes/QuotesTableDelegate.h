//
//  QuotesTable.h
//  Quotes
//
//  Created by Marcin Belczewski on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QuotesTableDelegate : NSObject<UITableViewDelegate, UITableViewDataSource> {
    NSArray *data;
@private
    UITableView *_ownerView;
}
@property (nonatomic, retain) NSArray *data;
@property (nonatomic, retain) UITableView * ownerView;
@end
