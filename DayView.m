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
@synthesize hasDate;

-(id) initAtX:(int)x atY:(int)y{
    //create frame for it
    CGRect frame = CGRectMake (x,//x
                               y,//y
                               [ViewConstants DAY_VIEW_WIDTH],//w
                               [ViewConstants DAY_VIEW_HEIGHT]//h
                               );
    
    self = [super initWithFrame:frame];
    if (self) {
        
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
    return self;    
}

- (void)dealloc
{
    [super dealloc];
}

-(void) setDate:(int)d inMonth:(int)m inYear:(int)y {
    [self setHasDate:YES];
    [self setDayOfMonth:d];
    [self setMonth:m];
    [self setYear:y];
    
    CGRect frame = CGRectMake (0, 0, [ViewConstants DAY_VIEW_WIDTH], 50);
    
    UILabel* labelDay;
    labelDay = [[UILabel alloc] initWithFrame:frame];
    [labelDay setFont:[UIFont systemFontOfSize:24]];
    [labelDay setText:[NSString stringWithFormat:@"%d", [self dayOfMonth]]];
    [self addSubview:labelDay];
    
    //set a border
    self.layer.borderWidth = 3.0f;
    self.layer.cornerRadius = 24;  
    
    //check if this date view is showing todays date
    if ([DateUtils isToday:[self dayOfMonth] inMonth:[self month] inYear:[self year]]) {
        [labelDay setTextColor:[UIColor blackColor]];
        [labelDay setBackgroundColor:[UIColor yellowColor]]; 
        self.layer.borderColor = [UIColor yellowColor].CGColor;        
    }
    else {
        [labelDay setTextColor:[UIColor whiteColor]];
        [labelDay setBackgroundColor:[UIColor blueColor]]; 
        self.layer.borderColor = [UIColor blueColor].CGColor;        
    }
}

-(void) setWeekLabel:(NSString*)str {
    [self setHasDate:NO];
    
    CGRect frame = CGRectMake (0, 0, [ViewConstants DAY_VIEW_WIDTH],
                               [ViewConstants DAY_VIEW_HEIGHT]);
    
    //create label for it
    UILabel* labelDay;
    labelDay = [[UILabel alloc] initWithFrame:frame];
    [labelDay setTextAlignment:UITextAlignmentCenter];
    [labelDay setTextColor:[UIColor blackColor]];
    [labelDay setBackgroundColor:[UIColor clearColor]];
    [labelDay setFont:[UIFont systemFontOfSize:80]];
    [labelDay setText:str];
    [self addSubview:labelDay];
}

-(void) clear {
    self.layer.borderColor = [UIColor clearColor].CGColor;
    for(UIView *subview in [self subviews]) {
        [subview removeFromSuperview];
    }
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
