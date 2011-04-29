//
//  Month.h
//  ZoomCalendar
//
//  Created by hasan on 4/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Month : NSObject {
    int month;
    int year;
}

@property (nonatomic, assign) int month;
@property (nonatomic, assign) int year;

-(id) initWithMonth:(int)m inYear:(int)yr;

@end
