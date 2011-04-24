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
    [[self view] setBackgroundColor:[UIColor blackColor]];
        
    CGFloat scrollWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat scrollHeight = [UIScreen mainScreen].bounds.size.height;
    
    scrollView = [[CalendarScroll alloc] initWithFrame:CGRectMake(0, 0, scrollWidth, scrollHeight)];
    [[self view] addSubview:scrollView];
    [scrollView release];
    
    [[self view] bringSubviewToFront:buttonToday];
}    

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    scrollView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction) buttonToday_click {
    NSLog(@"ZoomCalendarViewController: buttonToday_click: start");
    [scrollView scrollToDate:[NSDate date]];
    NSLog(@"ZoomCalendarViewController: buttonToday_click: end");
}

@end
