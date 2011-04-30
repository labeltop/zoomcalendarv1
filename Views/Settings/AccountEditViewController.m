//
//  AccountEditViewController.m
//  ZoomCalendar
//
//  Created by hasan on 4/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AccountEditViewController.h"

@implementation AccountEditViewController

@synthesize account;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //[[self view] setBackgroundColor:[ViewConstants COLOR_BACKGROUND]];
        
        //add event handlers
        
        // This hides the view
        [[self view] setFrame:CGRectMake(224, 1004, 320, 480)];
                
        arraySelectedRows = [[[NSMutableArray alloc] init] autorelease];
        [arraySelectedRows retain];
        
        account = [[CalendarAccount alloc] init];
        [txtUsername setText:@"hasank2@gmail.com"];
        [txtPassword setText:@"tennis"];
    }
    return self;
}

- (void)dealloc
{
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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

-(void) clear {
	[tblCalendars reloadData];
}

-(void) show {
    [self clear];
    
	CGRect frame = [[self view] frame];
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:.75];
	
	frame.origin.x = 224;
	frame.origin.y = 200;
    [[self view] setFrame:frame];
    
	[UIView commitAnimations];
}

-(void) hide {    
	CGRect frame = [[self view] frame];
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:.75];
	
	frame.origin.x = 224;
	frame.origin.y = 1004;
    [[self view] setFrame:frame];
    
	[UIView commitAnimations];    
}

-(IBAction) cancel {
    [self clear];
    [self hide];
}

-(IBAction) save {
    [self hide];    
}

-(IBAction) fetch {
    [activity startAnimating];
    
    NSString* user = [txtUsername text];    
    NSString* pass = [txtPassword text];
    
    //validate it
    if (![Validator isValidUsername:user]) {
        return;
    }
    if (![Validator isValidPassword:pass]) {
        return;
    }
    
    //create accont
    [account setUser:[[txtUsername text] copyWithZone:nil]];
    [account setPass:[[txtPassword text] copyWithZone:nil]];
    [account setType:@"Google Calendar"];
    
    //get them
    GoogleCalendar* g = [GoogleCalendar GetInstance];
    [g getCalendarsForAccount:account forHolder:self];
}

-(void) setCalendars:(NSArray*)calendars {
    
    //remove prev
    [[account calendars] removeAllObjects];
    
    //add em
    for (Calendar* c in calendars) {
        [[account calendars] addObject:c];
    }
    
    //done
	[tblCalendars reloadData];
	[activity stopAnimating];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"numberOfRowsInSection: %d", [[account calendars] count]);
    
    return [[account calendars] count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	int row = [indexPath row];
    static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		//create a resulable cell
        cell = [[[UITableViewCell alloc] 
				 initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] 
				autorelease];
		
        [[cell textLabel] setTextColor:[UIColor whiteColor]];
        [[cell textLabel] setBackgroundColor:[UIColor clearColor]];
		[[cell textLabel] setFont:[UIFont systemFontOfSize:20]];
        [[cell textLabel] setMinimumFontSize:12];
    }
		
    // Configure the cell...
    [[cell textLabel] setText:[[[account calendars] objectAtIndex:row] name]];
	//check if this row is in selected ones
	NSNumber* thisRow = [NSNumber numberWithInt:[indexPath row]];	
	if ([arraySelectedRows containsObject:thisRow])
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	else
		cell.accessoryType = UITableViewCellAccessoryNone;
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[activity startAnimating];
    
	//select this row
	NSNumber* n = [NSNumber numberWithInt:[indexPath row]];
	
	//deal with it
	if ([arraySelectedRows containsObject:n]) {
		[arraySelectedRows removeObject:n];
	}
	else {
		[arraySelectedRows addObject:n];
	}
	    
	//redraw
	[tblCalendars reloadData];
	[activity stopAnimating];
}

@end
