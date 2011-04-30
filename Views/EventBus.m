//
//  EventBus.m
//  ZoomCalendar
//
//  Created by hasan on 4/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EventBus.h"

//shared var
static EventBus* sharedEventBus = nil;

@implementation EventBus

@synthesize calendarHolders;

-(id) init {
    if (!self) {
        self = [super init];
        calendarHolders = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) dealloc {
    [calendarHolders dealloc];
    [super dealloc];
}

-(void) registerListener:(id)obj {
    if ([obj conformsToProtocol:@protocol(CalendarAccountHolder)]) {
        [calendarHolders addObject:obj];
    }
}

-(void) registerEvent:(int)eventId withData:(id)obj {
    
    if (eventId == [EventBus CALENDAR_ADDED] || eventId == [EventBus CALENDAR_REMVOED] || eventId == [EventBus CALENDAR_EDITED]) {
        for (id<CalendarAccountHolder> c in calendarHolders) {
            [c reloadCalendars];
        }
    }    
}


+(int) CALENDAR_ADDED {
    return 0;
}
+(int) CALENDAR_REMVOED {
    return 1;
}
+(int) CALENDAR_EDITED {
    return 2;
}

//singleton method
+(EventBus*) GetInstance
{
	@synchronized(self)
	{
		if (sharedEventBus == nil)
		{
			sharedEventBus = [[self alloc] init];
		}
	}
	return sharedEventBus;
}

@end
