//
//  MonthView.m
//  ZoomCalendar
//
//  Created by hasan on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MonthView.h"

@implementation MonthView

@synthesize month;
@synthesize year;

-(id) initWithMonth:(int)m AndYear:(int)yr atX:(int)x atY:(int)y {
    NSLog(@"MonthView: initWithMonth: start");

    //create frame for it
    CGRect frame = CGRectMake (x,//x
                               y,//y
                               [ViewConstants MONTH_VIEW_WIDTH],//w
                               [ViewConstants MONTH_VIEW_HEIGHT]//h
                               );
    //make it
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        [self setMonth:m];
        [self setYear:yr];
        
        //show month title
        CGRect labelTitleFrame = CGRectMake(0, 0, [ViewConstants MONTH_VIEW_WIDTH], [ViewConstants DAY_VIEW_HEIGHT]);
        UILabel* labelTitle = [[UILabel alloc] initWithFrame:labelTitleFrame];
        [labelTitle setTextAlignment:UITextAlignmentCenter];
        [labelTitle setText:[DateUtils GetMonthTitle:[self month]]];
        [self addSubview:labelTitle];
        
        //calc offset
        int yOffset = [ViewConstants DAY_VIEW_HEIGHT];
        
        //put day labels
        int daysInWeek = [DateUtils GetNumberOfdaysInWeek];
        for(int i=1; i <= daysInWeek; i++) {
            //its all at the top
            int y = yOffset;
            
            //get x
            int x = [ViewConstants DAY_VIEW_WIDTH] * (i-1);
            NSLog(@"      MonthView: i %d: %d,%d", i,x,y);
            
            //create  view for this day and add it
            DayView* v = 
                    [[DayView alloc] initWithLabel:[DateUtils GetDayOfWeekTitle:i] atX:x atY:y];
            //add it
            [self addSubview:v];
        }
        
        //update offset
        yOffset = yOffset + [ViewConstants DAY_VIEW_HEIGHT];
        
        //get number of days in this month
        int daysInMonth = [DateUtils GetNumberOfDaysInMonth:[self month] inYear:[self year]];
        NSLog(@"MonthView: daysInMonth: %d", daysInMonth);
        
        //figure out whats day of week for 1st of month
        int numberOfDaysInWeek = [DateUtils GetNumberOfdaysInWeek];
        int dayOfWeek = [DateUtils GetDayfWeek:1 inMonth:[self month] inYear:[self year]];
        NSLog(@"MonthView: startDayOfWeek: %d", dayOfWeek);
        
        int weekOfMonth = 0;
        int day = 1;
        int x = -1;
        int y = -1;
        do {
            
            //get x, offset by -1 so its flush on left side
            x = [ViewConstants DAY_VIEW_WIDTH] * (dayOfWeek - 1);
            
            //
            y = ([ViewConstants DAY_VIEW_HEIGHT] * weekOfMonth) + yOffset;
            NSLog(@"      MonthView: day %d (%d): %d,%d", day,dayOfWeek,x,y);
            
            
            //create  view for this day and add it
            DayView* dv = [[DayView alloc] initWithDate:day inMonth:month inYear:year atX:x atY:y];
            //add it
            [self addSubview:dv];
            
            //go to next day
            day++;
            
            //go to next day of week, we use this for x offset
            if (dayOfWeek == numberOfDaysInWeek) {
                dayOfWeek = 1;
                weekOfMonth++;
            }
            else
                dayOfWeek++;
            
            
        } while (day <= daysInMonth);
    }
    return self;    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    [super dealloc];
}

@end
