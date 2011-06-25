//
//  SummaryCell.m
//  EEIPad
//
//  Created by grzegorz.chlodzinski on 6/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SummaryCell.h"


@implementation SummaryCell
@synthesize title;
@synthesize category;
@synthesize date;
@synthesize summary;
@synthesize image;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.selectionStyle = UITableViewCellSelectionStyleGray;

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    [title release];
    [category release];
    [date release];
    [summary release];
    [image release];
    [super dealloc];
}

@end
