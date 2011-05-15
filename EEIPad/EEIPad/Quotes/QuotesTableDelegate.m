//
//  QuotesTable.m
//  Quotes
//
//  Created by Marcin Belczewski on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QuotesTableDelegate.h"
#import "QuotesTableCell.h"
#import "Quote.h"
#import "QuotesCategory.h"


@implementation QuotesTableDelegate
@synthesize data;
@synthesize ownerView = _ownerView;


- (void)categoryUpdated:(id)categoryUpdated {

    //NSLog(@"updating though notifications");
    QuotesCategory *category = [categoryUpdated object];
    self.data = category.quotes;
    [self.ownerView reloadData];

}



- (id)init {
    self = [super init];
    if (self) {

    }

    return self;
//To change body of implemented methods use File | Settings | File Templates.
}

- (void)dealloc {
    [data release];
    [_ownerView release];
    [super dealloc];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //create a cell
    static NSString *CellIdentifier = @"quotesTableCell";

    QuotesTableCell *cell = (QuotesTableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        //NSLog(@"Cell created");

        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"QuotesTableCell" owner:nil options:nil];

        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[QuotesTableCell class]]) {
                cell = (QuotesTableCell *)currentObject;
                break;
            }
        }
    }


    Quote *quote = [data objectAtIndex:indexPath.row];
    id changeColor = [UIColor greenColor];
    NSString *changeIcon = @"green_up.png";
    if ([quote isNegativeChange]) {
        changeColor = [UIColor redColor];
        changeIcon = @"red_down.png";
    }
    [[cell name] setText:quote.name];
    [[cell price] setText:quote.price];
    [[cell change] setText:quote.change];
    [[cell change] setTextColor:changeColor];
    [[cell changePercent] setText:quote.changePercent];
    [[cell changePercent] setTextColor:changeColor];
    [[cell trendImage] setImage:[UIImage imageNamed:changeIcon]];
    return cell;
}

- (void)startLoadingQuotes:(NSString *)quotesType {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(categoryUpdated:) name:quotesType object:nil];
}
@end
