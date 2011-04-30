//
//  DBStorage.h
//  ZoomCalendar
//
//  Created by hasan on 4/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalendarAccount.h"
#import "Calendar.h"

@interface DBStorage : NSObject {
    
}

-(NSArray*) getCalendarAccounts;
-(NSArray*) getCalendarsForAccount:(CalendarAccount*)ca;

+(DBStorage*) GetInstance;
@end
