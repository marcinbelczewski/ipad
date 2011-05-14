//
//  CategoryViewController.m
//  ViewBased4EEIPad
//
//  Created by Worker on 4/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CategoryViewController.h"
#import "WebRequest.h"
#import "JSONKit.h"
#import "Article.h"
#import "ArticlesGroup.h"

@implementation CategoryViewController

@synthesize arcticleView,listView;

-(id)init
{
    self = [super init];
    return self;
}

-(void)refreshWithCategory:(NSString *)category
{
    self->webRequest = [[WebRequest alloc] initWithURLString:[[NSString alloc] initWithFormat:@"http://qaeei.ihsglobalinsight.com/energy/IPadArticle/GetLatest?categoryName=%@",category]];
    self->webRequest.delegate = self;
    [webRequest makeRequest];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [articleGroups count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ArticlesGroup* group = [articleGroups objectAtIndex:section];
    return [group.articles count];
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    ArticlesGroup* group = [articleGroups objectAtIndex:section];
    return group.group;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Article *article = [((ArticlesGroup*)[articleGroups objectAtIndex:[indexPath section]]).articles objectAtIndex:[indexPath row]];
                        
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
    cell.textLabel.text = article.title;
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

//- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
//	return indexPath;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Article *article = [((ArticlesGroup*)[articleGroups objectAtIndex:[indexPath section]]).articles objectAtIndex:[indexPath row]];

    NSString *cellText = article.title;
    UIFont *cellFont = [UIFont fontWithName:@"Helvetica" size:13.0];
    CGSize constraintSize = CGSizeMake(280.0f, MAXFLOAT);
    CGSize labelSize = [cellText sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
    
    return labelSize.height + 30;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Article *article = [((ArticlesGroup*)[articleGroups objectAtIndex:[indexPath section]]).articles objectAtIndex:[indexPath row]];
    NSString *str = [[NSString alloc] initWithFormat:
                     @"http://qaeei.ihsglobalinsight.com/energy/IPadArticle/GetById?id=%d",article.identifier];
    [arcticleView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];

}

-(NSDate *) dateFromJson: (NSString *)json
{
    
    // This will tell number of seconds to add according to your default timezone
    // Note: if you don't care about timezone changes, just delete/comment it out
    NSInteger offset = [[NSTimeZone defaultTimeZone] secondsFromGMT];
    
    // A range of NSMakeRange(6, 10) will generate "1292851800" from "/Date(1292851800000+0100)/"
    // as in example above. We crop additional three zeros, because "dateWithTimeIntervalSince1970:"
    // wants seconds, not milliseconds; since 1 second is equal to 1000 milliseconds, this will work.
    // Note: if you don't care about timezone changes, just chop out "dateByAddingTimeInterval:offset" part
    return  [[NSDate dateWithTimeIntervalSince1970:
                     [[json substringWithRange:NSMakeRange(6, 10)] intValue]]
                    dateByAddingTimeInterval:offset];
    
}
-(void) dataLoaded:(NSData*)data
{
    NSArray *articles = [data objectFromJSONData];
    NSMutableDictionary *articlesByDate = [[NSMutableDictionary alloc]init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    
    [articles enumerateObjectsUsingBlock:^(id art, NSUInteger idx, BOOL *stop) {
        
        NSDictionary *artDict = (NSDictionary *)art;
        
        NSDate *date = [self dateFromJson: [artDict objectForKey:@"PublishDate"]];
        NSString *keyFromArt = [formatter stringFromDate:date];
        keyFromArt = @"Articles";
        NSMutableArray *articlesV = [articlesByDate objectForKey:keyFromArt];
        if(articlesV == nil)
        {
            articlesV = [[NSMutableArray alloc]init];
            [articlesByDate setObject:articlesV forKey:keyFromArt];
            
        }   
        [articlesV addObject:art];
        
    }];

    articleGroups = [[NSMutableArray alloc]init];
    
    [[articlesByDate allKeys]enumerateObjectsUsingBlock:^(id key, NSUInteger idx, BOOL *stop) {
        NSArray *values = [articlesByDate valueForKey:(NSString*)key];
        [articleGroups addObject:[[ArticlesGroup alloc]initWithDate:(NSString*)key withArticles:values]];
    }];

    [listView reloadData];
    
    int i=0; 
 }


@end
