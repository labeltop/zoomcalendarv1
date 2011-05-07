//
//  MonthView.h
//  ZoomCalendar
//
//  Created by hasan on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DayView.h"
#import "DateUtils.h"
#import "ViewConstants.h"
#import "CalendarAccountHolder.h"
#import "DBStorage.h"
#import "CalendarAccount.h"
#import "Calendar.h"
#import "GoogleCalendar.h"

@interface MonthView : UIView <CalendarEventHolder> {
    
    //get a specific date
    int month;
    int year;
    
    //ui
    UILabel* labelTitle;
    NSMutableArray* dayViews;
        
}

@property (nonatomic, assign) int month;
@property (nonatomic, assign) int year;

-(id) initAtX:(int)x atY:(int)y;
-(void) setMonth:(int)m inYear:(int)y;

-(void) clear;
-(void) load;

@end
