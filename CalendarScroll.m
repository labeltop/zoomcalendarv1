//
//  CalendarScroll.m
//  ZoomCalendar
//
//  Created by hasan on 4/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalendarScroll.h"

@implementation CalendarScroll

-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setScrollEnabled:YES];
        [self setClipsToBounds:YES];
        [self setBackgroundColor:[UIColor clearColor]];
        
        //set delete to myself
        [self setDelegate:self];
        
        //set scroll dimentions to max of whatever its running on
        CGFloat scrollWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat scrollHeight = [UIScreen mainScreen].bounds.size.height;
        [self setContentSize:CGSizeMake([ViewConstants YEAR_VIEW_WIDTH], [ViewConstants YEAR_VIEW_HEIGHT])];
        
        //The 50% content inset allows us to move the corners of the content 
        //view to the center of the frame, and thereby to zoom in on or out from them.
        CGFloat insetHorizontal = scrollWidth * 0.5;
        CGFloat insetVertical = scrollHeight * 0.5;
        //set the content inset to half of the screen
        [self setContentInset:UIEdgeInsetsMake(insetVertical, insetHorizontal, insetVertical, insetHorizontal)];
        
        //these settings control only the minimum or maximum change in
        //zoom during any one pinch gesture; actual zoom is unconstrained
        [self setMaximumZoomScale:6.0];
        [self setMinimumZoomScale:0.2];
        
        //add the content
        content = [[YearView alloc] initWithYear:2011 atX:0 atY:0];
        [self addSubview:content];
        
        //set current zoom
        currentZoom = 1.0;
        [self setZoomScale:currentZoom];
    }
    return self;
}

- (UIView*)viewForZoomingInScrollView:(UIScrollView*)scrollView
{
	return content;
}

-(void) scrollToDate:(NSDate*)d {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:d];
    NSInteger day = [components day];    
    NSInteger month = [components month];
    NSInteger year = [components year];
    
    CGPoint location = [content getDateLocation:day inMonth:month inYear:year];  
    [self setContentOffset:CGPointMake(1600, 0) animated:TRUE];
    NSLog(@"CalendarScroll: scrollToDate: location: (%f, %f)", location.x, location.y);  
}

@end
