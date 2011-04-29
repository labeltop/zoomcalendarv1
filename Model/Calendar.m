//
//  Calendar.m
//  CalendarCalculator
//
//  Created by hasan on 3/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Calendar.h"

@implementation Calendar

@synthesize name;

-(id) initWithName:(NSString*)n {
    self = [super init];
    if (self) {
        [self setName:n];
    }
    return self;
}

-(NSString*) description {
	return [NSString stringWithFormat:@"name:%@", [self name]];
}

@end
