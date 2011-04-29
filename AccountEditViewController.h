//
//  AccountEditViewController.h
//  ZoomCalendar
//
//  Created by hasan on 4/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewConstants.h"
#import "GDataServiceGoogleCalendar.h"
#import "GDataFeedCalendar.h"
#import "GDataEntryCalendar.h"
#import "GDataTextConstruct.h"

@interface AccountEditViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    
    IBOutlet UITextField* txtUsername;
    IBOutlet UITextField* txtPassword;
    IBOutlet UITableView* tblCalendars;
    IBOutlet UIActivityIndicatorView* activity;
    
    NSMutableArray* arrayCalendarNames;
}

-(void) clear;
-(void) show;
-(IBAction) save;
-(IBAction) cancel;
-(IBAction) fetch;

- (void)ticket:(GDataServiceTicket *)ticket finishedWithFeed:(GDataFeedCalendar *)feed error:(NSError *)error;

@end
