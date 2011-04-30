//
//  EventBus.h
//  ZoomCalendar
//
//  Created by hasan on 4/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalendarAccountHolder.h"

@interface EventBus : NSObject {
    
    NSMutableArray* calendarHolders;
    
}

@property (nonatomic, assign) NSMutableArray* calendarHolders;

-(void) registerListener:(id)obj;
-(void) registerEvent:(int)eventId withData:(id)obj;

//starts - events
+(int) CALENDAR_ADDED;
+(int) CALENDAR_REMVOED;
+(int) CALENDAR_EDITED;
//end - events

+(EventBus*) GetInstance;
@end
