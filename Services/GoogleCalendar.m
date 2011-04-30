//
//  GoogleCalendar.m
//  ZoomCalendar
//
//  Created by hasan on 4/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GoogleCalendar.h"

static GoogleCalendar* sharedGoogleCalendar = nil;

@implementation GoogleCalendar

-(void) getCalendarsForAccount:(CalendarAccount*)ca forHolder:(id<CalendarHolder>)h {
    calendarHolder = h;
    
	//get matching calendars
	GDataServiceGoogleCalendar* service = [[GDataServiceGoogleCalendar alloc] init];
	//auth
	[service setUserCredentialsWithUsername:[ca user]
								   password:[ca pass]];
	//feed of all calendars for user
	NSURL *feedURL = [GDataServiceGoogleCalendar calendarFeedURLForUsername:[ca user]];
	//get them
	[service fetchFeedWithURL:feedURL delegate:self didFinishSelector:@selector(ticket:finishedWithCalendarsForAccount:error:)];
}

- (void)ticket:(GDataServiceTicket *)ticket finishedWithCalendarsForAccount:(GDataFeedCalendar *)feed error:(NSError *)error {
	
	if (error != nil) {  
		NSLog(@"fetch error: %@", error);
        return;
	}
    
    //loop em
    NSMutableArray* calendars = [[NSMutableArray alloc] init];
	NSArray *entries = [feed entries];	
	for(GDataEntryCalendar* cal in entries) {
        
		//get its name
		GDataTextConstruct* name = [cal title];
        NSString* nameStr = [name stringValue];
        NSLog(@"finishedWithFeed: nameStr %@", nameStr);
        
		//create calendar
        Calendar* c = [[Calendar alloc] initWithName: [nameStr copyWithZone:nil]];
        NSLog(@"finishedWithFeed: Calendar %@", c);
        
        //save it
        [calendars addObject:c];
	}
    
    [calendarHolder setCalendars:calendars];
}

+(GoogleCalendar*) GetInstance {
    @synchronized(self) {
        if (sharedGoogleCalendar == nil) {
            sharedGoogleCalendar = [[self alloc] init];
        }
    }
    return sharedGoogleCalendar; 
}
@end
