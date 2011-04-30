//
//  ZoomCalendarSettingsView.m
//  ZoomCalendar
//
//  Created by hasan on 4/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[self view] setBackgroundColor:[ViewConstants COLOR_BACKGROUND]];
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (IBAction)done:(id)sender {
    [self.delegate settingsViewControllerDidFinish:self]; 
}

-(IBAction) createAccount:(id)sender {
    AccountEditViewController* v = [[AccountEditViewController alloc] initWithNibName:@"AccountEditViewController" bundle:nil];
    [self.view addSubview:[v view]];
	[v show];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray* accounts = [[DBStorage GetInstance] getCalendarAccounts];
    return [accounts count];
}

//RootViewController.m
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    int row = [indexPath row];
    
    //see if we can get an old one
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    //configure it
    [cell setBackgroundColor:[UIColor clearColor]];
    [[cell textLabel] setBackgroundColor:[UIColor clearColor]];
    [[cell textLabel] setTextColor:[UIColor whiteColor]];
    
    NSArray* accounts = [[DBStorage GetInstance] getCalendarAccounts];
    CalendarAccount* ac = [accounts objectAtIndex:row];
    [[cell textLabel] setText:[NSString stringWithFormat:@"%@ (%@)", [ac user], [ac type]]];
        
    return cell;
}

@end
