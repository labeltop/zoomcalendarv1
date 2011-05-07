//
//  CalendarScroll.m
//  ZoomCalendar
//
//  Created by hasan on 4/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalendarScroll.h"

@implementation CalendarScroll

@synthesize visibleMonth;

-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //The 50% content inset allows us to move the corners of the content 
        //view to the center of the frame, and thereby to zoom in on or out from them.
        CGFloat insetHorizontal = 20;
        CGFloat insetVertical = 20;

        //create it
        content = [[MonthView alloc] initAtX:0 atY:0];
        
        [self setBackgroundColor:[UIColor clearColor]];
        [self setScrollEnabled:YES];
        [self setClipsToBounds:YES];
        //set delete to myself
        [self setDelegate:self];
        //set scroll dimentions to max of whatever its running on
        [self setContentSize:CGSizeMake([ViewConstants MONTH_VIEW_WIDTH], [ViewConstants MONTH_VIEW_HEIGHT])];
        //set the content inset to half of the screen
        [self setContentInset:UIEdgeInsetsMake(insetVertical, insetHorizontal, insetVertical, insetHorizontal)];
        //these settings control only the minimum or maximum change in
        //zoom during any one pinch gesture; actual zoom is unconstrained
        [self setMaximumZoomScale:6.0];
        [self setMinimumZoomScale:0.35];
        //add the content
        [self addSubview:content];
        //set current zoom
        [self setZoomScale:0.35];
        
        //set to current month
        [self scrollToMonth:[self currentMonth]];
    }
    return self;
}

- (UIView*)viewForZoomingInScrollView:(UIScrollView*)scrollView
{
	return content;
}

-(void) scrollToMonth:(Month*)m {
    [content setMonth:[m month] inYear:[m year]];
    //save it
    visibleMonth = m;
}

-(Month*) currentMonth {
    NSDate* d = [NSDate date];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:d];  
    NSInteger month = [components month];
    NSInteger year = [components year];
    return [[Month alloc] initWithMonth:month inYear:year];
}

-(Month*) nextMonth {
    int m = [visibleMonth month];
    int yr = [visibleMonth year];
    
    if (m == 12) {
        m = 1;
        yr++;
    }
    else {
        m++;
    }
    
    Month* mth = [[Month alloc] initWithMonth:m inYear:yr];
    return mth;
}

-(Month*) prevMonth {
    int m = [visibleMonth month];
    int yr = [visibleMonth year];
    
    if (m == 1) {
        m = 12;
        yr--;
    }
    else {
        m--;
    }
    
    Month* mth = [[Month alloc] initWithMonth:m inYear:yr];
    return mth;    
}

-(void) refresh {
    [content load];
}

@end
