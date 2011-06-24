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
@synthesize listActivityIndicator;
@synthesize articleActivityIndicator;

-(id)init
{
    self = [super init];
    self.arcticleView.delegate = self;
    return self;
}

-(void)refreshWithCategory:(NSString *)category
{
    [self.listActivityIndicator startAnimating];
    self->webRequest = [[WebRequest alloc] initWithURLString:[NSString stringWithFormat:@"http://qaeei.ihsglobalinsight.com/energy/IPadArticle/GetLatest?categoryName=%@",category]];
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
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyIdentifier"] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
        cell.textLabel.numberOfLines = 10;
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:12.0];
        cell.detailTextLabel.font = [UIFont fontWithName:@"Helvetica" size:11.0];
    }
//    cell.textLabel.text = [NSString stringWithFormat:@"Article number %d",indexPath.row];
    cell.textLabel.text = article.title;
    if (article.date!=nil)
        cell.detailTextLabel.text=article.date;
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    NSString *cellText = article.title;
    UIFont *cellFont = [UIFont fontWithName:@"Helvetica" size:12.0];
    CGSize constraintSize = CGSizeMake(190.0f, MAXFLOAT);
    CGSize labelSize = [cellText sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];

    return labelSize.height+20;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Article *article = [((ArticlesGroup*)[articleGroups objectAtIndex:[indexPath section]]).articles objectAtIndex:[indexPath row]];
    NSString *str = [NSString stringWithFormat:
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
-(void) dataLoaded:(id)data
{
    [self.listActivityIndicator stopAnimating];

    NSArray *articles = (NSArray *) data;
    NSMutableDictionary *articlesByDate = [[NSMutableDictionary alloc]init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
//        NSString *keyFromArt = [formatter stringFromDate:date];

    
    [articles enumerateObjectsUsingBlock:^(id art, NSUInteger idx, BOOL *stop) {
        
        NSDictionary *artDict = (NSDictionary *)art;
        
        NSDate *date = [self dateFromJson: [artDict objectForKey:@"PublishDate"]];
//        NSString *keyFromArt = [formatter stringFromDate:date];
        NSString *keyFromArt = @"Articles";
        if([articlesByDate objectForKey:keyFromArt] == nil)
        {
            [articlesByDate setObject:[[[NSMutableArray alloc]init] autorelease] forKey:keyFromArt];
        }
        [[articlesByDate objectForKey:keyFromArt] addObject:art];

    }];

    [formatter release];

    [articleGroups release];
    articleGroups = [[NSMutableArray alloc]init];
    
    [[articlesByDate allKeys]enumerateObjectsUsingBlock:^(id key, NSUInteger idx, BOOL *stop) {
        
        NSArray *values = [articlesByDate valueForKey:(NSString*)key];
        [articleGroups addObject:[[[ArticlesGroup alloc]initWithDate:(NSString*)key withArticles:values] autorelease]];
    }];

    [articlesByDate release];

    [listView reloadData];
//    [listView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:true scrollPosition:UITableViewScrollPositionTop];
//    Article *article = [((ArticlesGroup*)[articleGroups objectAtIndex:0]).articles objectAtIndex:0];
//    NSString *str = [NSString stringWithFormat:
//                     @"http://eei.globalintech.pl/IPadArticle/GetById?id=%d",article.identifier];
//    [arcticleView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
   
 }


- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.articleActivityIndicator startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.articleActivityIndicator stopAnimating];
}
- requestFailed
{
    
}

- (void)dealloc {
    [articleGroups release];
    [webRequest release];
    [super dealloc];
}

@end
