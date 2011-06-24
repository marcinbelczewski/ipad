//
//  ConfigureWidgetsViewController.m
//  EEIPad
//
//  Created by Piotr Mionskowski on 6/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ConfigureWidgetsViewController.h"
#import <UIKit/UIColor.h>

@implementation ConfigureWidgetsViewController
@synthesize table;
@synthesize tableContainer;
    const float CornerRadius = 10.0f;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc {
    [table release];
    [tableContainer release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {

    self.tableContainer.layer.masksToBounds = YES;
    self.tableContainer.layer.cornerRadius =  CornerRadius;
    self.table.rowHeight = self.table.frame.size.width;
    self.table.separatorColor = [UIColor clearColor];
    self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
    // Rotates the view.

    CGRect containerFrame = self.tableContainer.frame;

    CGAffineTransform transform = CGAffineTransformMakeRotation(-1.5707963);
    self.table.transform = transform;
    // Repositions and resizes the view.

    CGRect contentRect = CGRectMake(0, 0, containerFrame.size.height, containerFrame.size.width);
    self.tableContainer.frame = CGRectMake(containerFrame.origin.x, containerFrame.origin.y, containerFrame.size.height, containerFrame.size.width) ;
    self.table.frame = contentRect;

    self.table.editing = YES;

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.


}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void)viewDidUnload {
    [self setTable:nil];
    [self setTableContainer:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleNone;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];


        cell.contentView.clipsToBounds = YES;
        //cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
        //cell.textLabel.numberOfLines = 0;
        //cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:13.0];

        CGAffineTransform transform = CGAffineTransformMakeRotation(1.5707963);
        cell.contentView.transform = transform;


         UIView *newContent;
        newContent = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ihslogo.png"]];
        newContent.contentMode = UIViewContentModeScaleAspectFit;
        //newContent.frame = cell.contentView.frame;
        [cell.contentView addSubview:newContent];
        //CGRect frame = cell.frame;
//        cell.frame = CGRectMake(frame.origin.x + 10, frame.origin.y + 10, frame.size.width - 10, frame.size.height - 10);
//        cell.backgroundColor = [UIColor blueColor];

        [newContent release];
    }

    // Configure the cell.
   // cell.textLabel.text = [NSString stringWithFormat:@"Item %d", indexPath.row];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {

}


@end
