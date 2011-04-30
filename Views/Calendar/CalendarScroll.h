//
//  CalendarScroll.h
//  ZoomCalendar
//
//  Created by hasan on 4/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/CoreAnimation.h>
#import "MonthView.h"
#import "Month.h"

@interface CalendarScroll : UIScrollView <UIScrollViewDelegate> {
    MonthView* content;
    Month* visibleMonth;
}

@property (nonatomic, assign) Month* visibleMonth;

-(void) scrollToMonth:(Month*)m;
-(Month*) currentMonth;
-(Month*) nextMonth;
-(Month*) prevMonth;

@end
