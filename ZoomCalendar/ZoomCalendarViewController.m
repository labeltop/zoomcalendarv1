//
//  ZoomCalendarViewController.m
//  ZoomCalendar
//
//  Created by hasan on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ZoomCalendarViewController.h"

@implementation ZoomCalendarViewController

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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
        
    CGFloat scrollWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat scrollHeight = [UIScreen mainScreen].bounds.size.height;
    
    scrollView = [[CalendarScroll alloc] initWithFrame:CGRectMake(0, 0, scrollWidth, scrollHeight)];
    [[self view] addSubview:scrollView];
    [scrollView release];
    
    [[self view] bringSubviewToFront:buttonForward];
    [[self view] bringSubviewToFront:buttonBack];
    [[self view] bringSubviewToFront:buttonToday];
    [[self view] bringSubviewToFront:buttonSettings];
}    

- (void)viewDidUnload
{
    [super viewDidUnload];
    scrollView = nil;
    buttonBack = nil;
    buttonForward = nil;
    buttonToday = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction) buttonToday_click {
    [scrollView scrollToMonth:[scrollView currentMonth]];
}

- (IBAction) buttonForward_click {
    [scrollView scrollToMonth:[scrollView nextMonth]];
}

- (IBAction) buttonBack_click {
    [scrollView scrollToMonth:[scrollView prevMonth]];
}

- (IBAction) buttonSettings_click {    
    SettingsViewController*  controller = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
    controller.delegate = self;
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
    
    [controller release];
}

- (void)settingsViewControllerDidFinish:(SettingsViewController*)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
