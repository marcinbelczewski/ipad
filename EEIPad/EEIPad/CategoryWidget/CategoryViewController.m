//
//  CategoryViewController.m
//  ViewBased4EEIPad
//
//  Created by Worker on 4/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CategoryViewController.h"


@implementation CategoryViewController

@synthesize arcticleView;

-(id)init
{
    self = [super init];
    self->articles = [[NSArray alloc]initWithObjects:@"NRG Sees Increased Solar Capacity amid Uncertain Nuclear Regulatory Outlook in US",@"PGNiG Looks at Tauron Partnership; Polish Shale Gas Continues to Excite",@"Total Anticipates Major Increase in Oil and Gas Production in Russia by 2020",@"GDF Suez and AREVA Eye Offshore Wind Partnership",@"Competition Commission Agrees Less Stringent TPA Rules for Rough Gas Storage",@"Reliance Strikes Gas Offshore India in Cauvery-Palar Basin", nil];
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [articles count];
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return section==0?@"Today":@"Yesterday";
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    cell = nil;
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyIdentifier"] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:13.0];
    }
//    cell.textLabel.text = [NSString stringWithFormat:@"Article number %d",indexPath.row];
    cell.textLabel.text = [articles objectAtIndex:indexPath.row];
//    NSString *path = [[NSBundle mainBundle] pathForResource:[item objectForKey:@"imageKey"] ofType:@"png"];
//    UIImage *theImage = [UIImage imageWithContentsOfFile:path];
//    cell.imageView.image = theImage;
 
    return cell;

    
//    if (cell == nil) {
//        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"MyIdentifier"] autorelease];
//    }
//    
//    CGRect contentRect = CGRectMake(00.0, 0.0, 210, 40);
//    UILabel *textView = [[UILabel alloc] initWithFrame:contentRect];
//	
//	textView.text = @"NRG Sees Increased Solar Capacity amid Uncertain Nuclear Regulatory Outlook in US";
//	textView.numberOfLines = 3;
//	textView.textColor = [UIColor blackColor];
//	textView.font = [UIFont systemFontOfSize:12];
//    [cell.contentView addSubview:textView];
//	[textView release];
    
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
	return indexPath;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellText = [articles objectAtIndex:indexPath.row];
    UIFont *cellFont = [UIFont fontWithName:@"Helvetica" size:13.0];
    CGSize constraintSize = CGSizeMake(280.0f, MAXFLOAT);
    CGSize labelSize = [cellText sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
    
    return labelSize.height + 30;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
    [arcticleView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.apple.com/"]]];

}



@end
