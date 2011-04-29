//
//  Calendar.h
//  CalendarCalculator
//
//  Created by hasan on 3/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CalendarAccount.h"

@interface Calendar : NSManagedObject {
    CalendarAccount* account;
	NSString* name;
}

@property (nonatomic, assign) CalendarAccount* account;
@property (nonatomic, assign) NSString* name;

@end
