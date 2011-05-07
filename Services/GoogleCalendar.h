//
//  GoogleCalendar.h
//  ZoomCalendar
//
//  Created by hasan on 4/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalendarAccount.h"
#import "Calendar.h"
#import "GDataServiceGoogleCalendar.h"
#import "GDataFeedCalendar.h"
#import "GDataEntryCalendar.h"
#import "GDataTextConstruct.h"
#import "CalendarHolder.h"
#import "CalendarEventHolder.h"
#import "GDataQueryCalendar.h"
#import "GDataDateTime.h"

@interface GoogleCalendar : NSObject {
    
    GDataServiceGoogleCalendar* service;
    
    id<CalendarHolder> calendarHolder;
    id<CalendarEventHolder> calendarEventHolder;
}

-(id) init;

-(void) getCalendarsForAccount:(CalendarAccount*)ca forHolder:(id<CalendarHolder>)h;
-(void) getCalendarEventsForAccount:(CalendarAccount*)ca inCalendar:(Calendar*)c forHolder:(id<CalendarEventHolder>)h;

+(GoogleCalendar*) GetInstance;
@end
