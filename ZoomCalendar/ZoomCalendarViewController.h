//
//  ZoomCalendarViewController.h
//  ZoomCalendar
//
//  Created by hasan on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"
#import "CalendarScroll.h"

@interface ZoomCalendarViewController : UIViewController <SettingsViewDelegate> {
    CalendarScroll* scrollView;
    
    IBOutlet UIButton* buttonForward;
    IBOutlet UIButton* buttonBack;
    IBOutlet UIButton* buttonToday;
    IBOutlet UIButton* buttonSettings;
}

-(IBAction) buttonSettings_click; 
-(IBAction) buttonToday_click;
-(IBAction) buttonForward_click;
-(IBAction) buttonBack_click;

@end
