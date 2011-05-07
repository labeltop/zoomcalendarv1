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

-(id) init {
    self = [super init];
    if (self) {
        service = [[GDataServiceGoogleCalendar alloc] init];
    }
    return self;
}

-(void) getCalendarsForAccount:(CalendarAccount*)ca forHolder:(id<CalendarHolder>)h {
    calendarHolder = h;
    calendarEventHolder = nil;
    
	//auth
	[service setUserCredentialsWithUsername:[ca user]
								   password:[ca pass]];
	//feed of all calendars for user
	NSURL *feedURL = [GDataServiceGoogleCalendar calendarFeedURLForUsername:[ca user]];
	//get them
	[service fetchFeedWithURL:feedURL delegate:self didFinishSelector:@selector(ticket:finishedWithCalendars:error:)];
}

-(void) getCalendarEventsForAccount:(CalendarAccount*)ca inCalendar:(Calendar*)c forHolder:(id<CalendarEventHolder>)h {
    calendarEventHolder = h;
    calendarHolder = nil;
    
	//auth
	[service setUserCredentialsWithUsername:[ca user]
								   password:[ca pass]];
	//feed of all calendars for user
	NSURL *feedURL = [GDataServiceGoogleCalendar calendarFeedURLForUsername:[ca user]];
	//get them
	[service fetchFeedWithURL:feedURL delegate:self didFinishSelector:@selector(ticket:finishedWithCalendars:error:)];    
}

- (void)ticket:(GDataServiceTicket *)ticket finishedWithCalendars:(GDataFeedCalendar *)feed error:(NSError *)error {
	
	if (error != nil) {  
		NSLog(@"fetch error: %@", error);
        return;
	}
    
    //loop em
    NSMutableArray* calendars = [[NSMutableArray alloc] init];
	NSArray *entries = [feed entries];	
	for(GDataEntryCalendar* cal in entries) {
        
        if (calendarHolder != nil) {
            //get its name
            GDataTextConstruct* name = [cal title];
            NSString* nameStr = [name stringValue];
            Calendar* c = [[Calendar alloc] initWithName: [nameStr copyWithZone:nil]];
            NSLog(@"finishedWithFeed: Calendar %@", c);        
            //save it
            [calendars addObject:c];
        }
        
        //get the events if somebody wants them
        if (calendarEventHolder != nil) {
            GDataLink *link = [cal alternateLink];
            if (link != nil) {
                
                //create bounds
                GDataDateTime* dttmStart = nil;
                GDataDateTime* dttmEnd = nil;
                
                //create query
                GDataQueryCalendar* query = [GDataQueryCalendar calendarQueryWithFeedURL:[link URL]];
                [query setPublishedMinDateTime:dttmStart];
                [query setPublishedMaxDateTime:dttmEnd];
                
                //get em
                [service fetchFeedWithQuery:query
                                 delegate:self
                        didFinishSelector:@selector(ticket:finishedWithCalendarEvents:error:)];
            }
        }
	}
    
    if (calendarHolder != nil) {
        [calendarHolder setCalendars:calendars];
    }
}


- (void)ticket:(GDataServiceTicket *)ticket finishedWithCalendarEvents:(GDataFeedCalendar *)feed error:(NSError *)error {
	
	if (error != nil) {  
		NSLog(@"fetch error: %@", error);
        return;
	}
    
    //loop em
    //NSMutableArray* calendarEvents = [[NSMutableArray alloc] init];
	NSArray *entries = [feed entries];	
	for(GDataEntryCalendar* calEvent in entries) {
        NSLog(@"finishedWithCalendarEventsForAccount: %@", calEvent);
	}
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

/*
- (void)beginFetchingFiveEventsFromCalendar:(GDataEntryCalendar *)calendar {
    
    NSURL *feedURL = [[calendar alternateLink] URL];
    
    GDataQueryCalendar* query = [GDataQueryCalendar calendarQueryWithFeedURL:feedURL];
    [query setStartIndex:1];
    [query setMaxResults:5];
    
    GDataServiceGoogleCalendar *service = [self calendarService];
    [service fetchFeedWithQuery:query
                       delegate:self
              didFinishSelector:@selector(queryTicket:finishedWithEntries:error:)];
}
*/
