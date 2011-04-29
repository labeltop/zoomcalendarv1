//
//  CalendarAccount.m
//  ZoomCalendar
//
//  Created by hasan on 4/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalendarAccount.h"

@implementation CalendarAccount

@synthesize user;
@synthesize pass;
@synthesize type;
@synthesize calendars;

-(id) init {
    self = [super init];
    if (self) {
        [self setCalendars:[[NSMutableArray alloc] init]];
    }
    return self;
}

-(NSString*) description {
	return [NSString stringWithFormat:@"user:%@ pass:%@ type:%@ cals:%@", user, pass, type, calendars];
}

@end
