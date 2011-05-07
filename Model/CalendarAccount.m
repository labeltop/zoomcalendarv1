//
//  CalendarAccount.m
//  ZoomCalendar
//
//  Created by hasan on 4/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalendarAccount.h"

@implementation CalendarAccount

@synthesize idCalendarAccount;
@synthesize user;
@synthesize pass;
@synthesize type;
@synthesize calendars;

-(NSString*) description {
	return [NSString stringWithFormat:@"id: %d, user:%@ pass:%@ type:%@ cals:%@", idCalendarAccount, user, pass, type];
}

@end
