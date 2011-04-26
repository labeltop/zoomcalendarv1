//
//  ZoomCalendarSettingsView.h
//  ZoomCalendar
//
//  Created by hasan on 4/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SettingsViewDelegate;

@interface SettingsViewController : UIViewController {
    
}
@property (nonatomic, assign) id<SettingsViewDelegate> delegate;

- (IBAction)done:(id)sender;

@end

@protocol SettingsViewDelegate
- (void) settingsViewControllerDidFinish:(SettingsViewController*)controller;
@end
