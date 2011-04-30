//
//  ZoomCalendarSettingsView.h
//  ZoomCalendar
//
//  Created by hasan on 4/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewConstants.h"
#import "AccountEditViewController.h"
#import "DBStorage.h"

@protocol SettingsViewDelegate;

@interface SettingsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    
}
@property (nonatomic, assign) id<SettingsViewDelegate> delegate;

-(IBAction) done:(id)sender;
-(IBAction) createAccount:(id)sender;

@end

@protocol SettingsViewDelegate
- (void) settingsViewControllerDidFinish:(SettingsViewController*)controller;
@end
