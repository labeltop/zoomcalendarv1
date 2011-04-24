//
//  DayView.m
//  ZoomCalendar
//
//  Created by hasan on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DayView.h"

@implementation DayView

@synthesize dayOfMonth;
@synthesize month;
@synthesize year;

-(id) initWithDate:(int)d inMonth:(int)m inYear:(int)yr atX:(int)x atY:(int)y{
    //create frame for it
    CGRect frame = CGRectMake (x,//x
                               y,//y
                               [ViewConstants DAY_VIEW_WIDTH],//w
                               [ViewConstants DAY_VIEW_HEIGHT]//h
                               );
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setDayOfMonth:d];
        [self setMonth:m];
        [self setYear:yr];
        [self create:[NSString stringWithFormat:@"%d", [self dayOfMonth]]];
    }
    return self;    
}

-(id) initWithLabel:(NSString*)str atX:(int)x atY:(int)y {
    //create frame for it
    CGRect frame = CGRectMake (x,//x
                               y,//y
                               [ViewConstants DAY_VIEW_WIDTH],//w
                               [ViewConstants DAY_VIEW_HEIGHT]//h
                               );
    
    self = [super initWithFrame:frame];
    if (self) {
        [self create:str];
    }
    return self;    
}

- (void)dealloc
{
    [super dealloc];
}

-(void) create:(NSString*)str {
    CGRect frame = CGRectMake (0, 0, [ViewConstants DAY_VIEW_WIDTH],
                        [ViewConstants DAY_VIEW_HEIGHT]);
    
    //create label for it
    UILabel* labelDay = [[UILabel alloc] initWithFrame:frame];
    [labelDay setText:str];
    [labelDay setTextAlignment:UITextAlignmentCenter];
    [labelDay setBackgroundColor:[UIColor clearColor]];
    [labelDay setTextColor:[UIColor whiteColor]];
    [self addSubview:labelDay];
    
	
	UITapGestureRecognizer *doubleTap = 
	[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];	
	[doubleTap setNumberOfTapsRequired:2];
	[self addGestureRecognizer:doubleTap];
	[doubleTap release];
	
	UITapGestureRecognizer *singleTap = 
	[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];	
	[singleTap setNumberOfTapsRequired:1]; // Unnecessary since it's the default
	[singleTap requireGestureRecognizerToFail:doubleTap];
	[self addGestureRecognizer:singleTap];
	[singleTap release];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return YES;
}

- (void)handleDoubleTap:(UITapGestureRecognizer *)sender {
	if (sender.state == UIGestureRecognizerStateEnded) {
		// handling code
		NSLog(@"DayView: handleDoubleTap");
	}
}

- (void)handleSingleTap:(UITapGestureRecognizer *)sender {
	if (sender.state == UIGestureRecognizerStateEnded) {
		// handling code
		NSLog(@"DayView: handleSingleTap");
	}
}

@end
