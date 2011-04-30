//
//  AccountEditViewController.h
//  ZoomCalendar
//
//  Created by hasan on 4/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calendar.h"
#import "CalendarAccount.h"
#import "ViewConstants.h"
#import "Validator.h"
#import "GoogleCalendar.h"
#import "CalendarHolder.h"

@interface AccountEditViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, CalendarHolder> {
    
    IBOutlet UITextField* txtUsername;
    IBOutlet UITextField* txtPassword;
    IBOutlet UITableView* tblCalendars;
    IBOutlet UIActivityIndicatorView* activity;
    
    CalendarAccount* account;
	NSMutableArray* arraySelectedRows;	
}

@property (nonatomic, assign) CalendarAccount* account;

-(void) show;
-(void) hide;

-(void) clear;
-(IBAction) save;
-(IBAction) cancel;
-(IBAction) fetch;

@end
