//
//  Calendar.m
//  CalendarCalculator
//
//  Created by hasan on 3/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Calendar.h"


@implementation Calendar

@synthesize account;
@synthesize name;

-(NSString*) description {
	return [NSString stringWithFormat:@"%@ name:%@", account, name];
}

@end
