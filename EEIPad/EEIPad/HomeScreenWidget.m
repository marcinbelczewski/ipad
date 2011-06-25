//
//  HomeScreenWidget.m
//  EEIPad
//
//  Created by grzegorz.chlodzinski on 6/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HomeScreenWidget.h"
#import "ArticleWithSummary.h"
#import "SummaryCell.h"


@implementation HomeScreenWidget
@synthesize activityIndicator = _activityIndicator;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        _categories = [[NSArray alloc] initWithObjects:@"Spotlight",@"News And Analysis",@"Latest Deal",@"One To Watch",@"Company Focus", @"Country Risk", @"Power Generation", @"People News",nil];
    }
    return self;
}

- (void)dealloc
{
    [_activityIndicator release];
    [_articles release];
    [_webRequest release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.activityIndicator startAnimating];
    self->_webRequest = [[WebRequest alloc] initWithURLString:[NSString stringWithFormat:@"http://qaeei.ihsglobalinsight.com/energy/IPadArticle/GetLatest?categoryName=%@",@"onetowatch"]];
    self->_webRequest.delegate = self;
    [_webRequest makeRequest];
}

- (void)viewDidUnload
{
    [self setActivityIndicator:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (_articles)
        return 8;
    else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"WebViewCell";
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
//        cell.selectionStyle = UITableViewCellSelectionStyleGray;
//        cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
//        cell.textLabel.numberOfLines = 10;
//        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:12.0];
//
//        UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 80)];
////        [cell addSubview:webView];
//
//
//    }




    SummaryCell *cell = (SummaryCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        //NSLog(@"Cell created");
        
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SummaryCell" owner:nil options:nil];
        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[SummaryCell class]]) {
                cell = (SummaryCell *)currentObject;
                break;
            }
        }

    }

    int index = indexPath.row;
    ArticleWithSummary *art = [_articles objectAtIndex:indexPath.row];
    cell.category.text = [_categories objectAtIndex:indexPath.row];
    [cell.image setImage:[UIImage imageNamed:[NSString stringWithFormat:@"summary%d.png",index%5]]];
//    cell.title.text = art.title;
//    cell.category.text=@"Latest deal";
//    [cell.webView loadHTMLString:art.summary baseURL:[[NSURL alloc] initWithString:@"http://qaeei.ihsglobalinsight.com/energy"]];
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 145;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

-(void) dataLoaded:(id)data
{
    [self.activityIndicator stopAnimating];

    NSArray *articlesData = (NSArray *) data;
    self->_articles = [[NSMutableArray alloc]init];


    [articlesData enumerateObjectsUsingBlock:^(id art, NSUInteger idx, BOOL *stop) {

        NSDictionary *artDict = (NSDictionary *)art;

        [self->_articles addObject:[[[ArticleWithSummary alloc] initWithDictionary: artDict] retain]];

    }];

    [self.tableView reloadData];


}

@end
