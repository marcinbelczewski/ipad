//
//  QuotesTable.m
//  Quotes
//
//  Created by Marcin Belczewski on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QuotesTableDelegate.h"
#import "QuotesTableCell.h"


@implementation QuotesTableDelegate
@synthesize data;

-(void)dealloc{
    [super dealloc];
    [data release];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //create a cell
    
    static NSString *CellIdentifier = @"quotesTableCell";
    
    QuotesTableCell *cell = (QuotesTableCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil){
        NSLog(@"Cell created");
        
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"QuotesTableCell" owner:nil options:nil];
        
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[QuotesTableCell class]])
            {
                cell = (QuotesTableCell *)currentObject;
                break;
            }
        }
    }
    
    
    float change = [[[data objectAtIndex:indexPath.row] objectForKey:@"change"] floatValue];
    id changeColor = [UIColor greenColor];
    NSString *changeIcon = @"green_up.png";
    if(change<0.0f)
    {
        changeColor =  [UIColor redColor];
        changeIcon = @"red_down.png";
    }
    [[cell name] setText:[[data objectAtIndex:indexPath.row] objectForKey:@"name"]];
    [[cell price] setText:[[data objectAtIndex:indexPath.row] objectForKey:@"price"]];
    [[cell change] setText:[NSString stringWithFormat:@"%f",change]];
    [[cell change] setTextColor:changeColor];    
    [[cell changePercent] setText:[[data objectAtIndex:indexPath.row] objectForKey:@"changePercent"]];  
    [[cell changePercent] setTextColor:changeColor];
    [[cell trendImage] setImage:[UIImage imageNamed:changeIcon]];
    
    return cell;
}
@end
