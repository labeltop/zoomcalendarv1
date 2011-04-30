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

@interface GoogleCalendar : NSObject {
    
    id<CalendarHolder> calendarHolder;
    
}

-(void) getCalendarsForAccount:(CalendarAccount*)ca forHolder:(id<CalendarHolder>)h;

+(GoogleCalendar*) GetInstance;
@end
