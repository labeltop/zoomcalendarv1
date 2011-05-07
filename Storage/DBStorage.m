#import "DBStorage.h"

//shared var
static DBStorage* sharedStorage = nil;

@implementation DBStorage

-(NSArray*) getCalendarAccounts {
    
    CalendarAccount* ac = [[CalendarAccount alloc] init];
    [ac setIdCalendarAccount:1];
    [ac setUser:@"hasank2@gmail.com"];
    [ac setPass:@"tennis"];
    [ac setType:@"Google Calendar"];
    
    return [NSArray arrayWithObjects:ac, nil];
}

-(NSArray*) getCalendarsForAccount:(CalendarAccount*)ca {
    Calendar* c = [[Calendar alloc] init];
    [c setIdCalendarAccount:1];
    [c setName:@"LabelTop"];
        
    [[ca calendars] addObject:c];
    return [NSArray arrayWithObjects:ca, nil];
}

+(DBStorage*) GetInstance {
	@synchronized(self) {
		if (sharedStorage == nil) {
			sharedStorage = [[self alloc] init];
		}
	}
	return sharedStorage;    
}

@end
