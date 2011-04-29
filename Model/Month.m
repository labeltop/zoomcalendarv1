//
//  Month.m
//  ZoomCalendar
//
//  Created by hasan on 4/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Month.h"


@implementation Month

@synthesize month;
@synthesize year;

-(id) initWithMonth:(int)m inYear:(int)yr {
    self = [super init];
    if (self) {
        [self setMonth:m];
        [self setYear:yr];
    }
    return self;
}

-(NSString*) description {
    return [NSString stringWithFormat:@"Month: %d Year: %d", month, year];
}

@end
