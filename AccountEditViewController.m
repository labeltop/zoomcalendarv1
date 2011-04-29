//
//  AccountEditViewController.m
//  ZoomCalendar
//
//  Created by hasan on 4/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AccountEditViewController.h"


@implementation AccountEditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //[[self view] setBackgroundColor:[ViewConstants COLOR_BACKGROUND]];
        
        //add event handlers
        
        // This hides the view
        [[self view] setFrame:CGRectMake(224, 1004, 320, 480)];
        
        arrayCalendarNames = [[NSMutableArray alloc] init];
        
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
    [arrayCalendarNames removeAllObjects];  
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

-(IBAction) cancel {
    [self clear];
    
	CGRect frame = [[self view] frame];
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:.75];
	
	frame.origin.x = 224;
	frame.origin.y = 1004;
    [[self view] setFrame:frame];
    
	[UIView commitAnimations];
}

-(IBAction) save {
    
}

-(IBAction) fetch {
    [activity startAnimating];
    
    NSString* user = [txtUsername text];
    NSString* pass = [txtPassword text];
        
    
	//get matching calendars
	GDataServiceGoogleCalendar* service = [[GDataServiceGoogleCalendar alloc] init];
	//auth
	[service setUserCredentialsWithUsername:user
								   password:pass];
	//feed of all calendars for user
	NSURL *feedURL = [GDataServiceGoogleCalendar calendarFeedURLForUsername:[txtUsername text]];
	//get them
	[service fetchFeedWithURL:feedURL delegate:self didFinishSelector:@selector(ticket:finishedWithFeed:error:)];
}

- (void)ticket:(GDataServiceTicket *)ticket finishedWithFeed:(GDataFeedCalendar *)feed error:(NSError *)error {
	
	if (error != nil) {  
		NSLog(@"fetch error: %@", error);
	}
	NSArray *entries = [feed entries];
	
	for(GDataEntryCalendar* cal in entries) {
		//get its name
		GDataTextConstruct* name = [cal title];

        [arrayCalendarNames addObject:[name stringValue]];
        
		/*
		Calendar* c = [[Calendar alloc] init];
		[c setName:[[name stringValue] retain]];
		[c setUser:[[txtUsername text] copyWithZone:nil]];
		[c setPass:[[txtPassword text] copyWithZone:nil]];
		[c setType:[[AccountTypes GOOGLE] copyWithZone:nil]];
		[arrayCalendars addObject:c];
         */
	}
	
	//done
	[tblCalendars reloadData];
	[activity stopAnimating];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arrayCalendarNames count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	int row = [indexPath row];
	
	const NSInteger TOP_LABEL_TAG = 1001;
    static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    UILabel* labelWord;
    if (cell == nil) {
		//create a resulable cell
        cell = [[[UITableViewCell alloc] 
				 initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] 
				autorelease];
		
		
		// Create the label for the top row of text
		labelWord =
		[[[UILabel alloc]
		  initWithFrame:
		  CGRectMake(
					 0,
					 0,
					 200,
					 40)]
		 autorelease];
		[labelWord setBackgroundColor:[UIColor clearColor]];
		labelWord.tag = TOP_LABEL_TAG;
		labelWord.font = [UIFont systemFontOfSize:20];
		[labelWord setMinimumFontSize:8];
		[labelWord setBackgroundColor:[UIColor clearColor]];
		[labelWord setTextColor:[UIColor whiteColor]];
		[labelWord setNumberOfLines:3];
		[cell.contentView addSubview:labelWord];
    }
    else {
        labelWord = (UILabel*)[cell.contentView viewWithTag:TOP_LABEL_TAG];
    }
		
    // Configure the cell...
    [labelWord setText:[arrayCalendarNames objectAtIndex:row]];
	
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
}

@end







