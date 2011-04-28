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
        [[self view] setBackgroundColor:[ViewConstants COLOR_BACKGROUND]];
        
        // This hides the view
        [[self view] setFrame:CGRectMake(224, 1004, 320, 480)];
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

-(void) show {
    //  UIView *view = self.view;
	CGRect frame = [[self view] frame];
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:.75];
	
	frame.origin.y = 224;
	frame.origin.x = 200;
    [[self view] setFrame:frame];
    
	[UIView commitAnimations];
}

@end
