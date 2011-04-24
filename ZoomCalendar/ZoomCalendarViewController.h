//
//  ZoomCalendarViewController.h
//  ZoomCalendar
//
//  Created by hasan on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarScroll.h"

@interface ZoomCalendarViewController : UIViewController {
    CalendarScroll* scrollView;
    
    IBOutlet UIButton* buttonToday;
}

-(IBAction)buttonToday_click;

@end
