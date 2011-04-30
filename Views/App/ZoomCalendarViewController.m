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
    
    [[self view] setBackgroundColor:[ViewConstants COLOR_BACKGROUND]];
}    

- (void)viewDidUnload
{
    [super viewDidUnload];
    scrollView = nil;
    buttonBack = nil;
    buttonForward = nil;
    buttonToday = nil;
} 

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown || interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    if(toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown){
        //self.view = portraitView;
        [self changeTheViewToPortrait:YES andDuration:duration];
        
    }
    else if(toInterfaceOrientation == UIInterfaceOrientationLandscapeRight || toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft){
        //self.view = landscapeView;
        [self changeTheViewToPortrait:NO andDuration:duration];
    }
}

- (void) changeTheViewToPortrait:(BOOL)portrait andDuration:(NSTimeInterval)duration {
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    [self view].frame = CGRectMake(0, 0, screenWidth, screenHeight);    
    scrollView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    
    if(portrait){
        //change the view and subview frames for the portrait view
        imageTrash.frame = CGRectMake(20, 920, 64, 64);
        buttonSettings.frame = CGRectMake(730, 965, 18, 19);
    }
    else{   
        //change the view and subview  frames for the landscape view
        imageTrash.frame = CGRectMake(20, 664, 64, 64);
        buttonSettings.frame = CGRectMake(980, 709, 18, 19);
    }
    
    [UIView commitAnimations];
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
