//
//  CalendarAccount.h
//  ZoomCalendar
//
//  Created by hasan on 4/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CalendarAccount : NSObject {
    int idCalendarAccount;
    
    //credentials
	NSString* user;
	NSString* pass;
	//the tpe of account - google, ical, exchange
	NSString* type;
    
    NSMutableArray* calendars;
}

@property (nonatomic, assign) int idCalendarAccount;
@property (nonatomic, assign) NSString* user;
@property (nonatomic, assign) NSString* pass;
@property (nonatomic, assign) NSString* type;
@property (nonatomic, assign) NSMutableArray* calendars;

@end
