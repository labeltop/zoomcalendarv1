//
//  YearView.m
//  ZoomCalendar
//
//  Created by hasan on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "YearView.h"

@implementation YearView

@synthesize year;

-(id) initWithYear:(int)yr atX:(int)x atY:(int)y {
    //create frame for it
    CGRect frame = CGRectMake (x,//x
                               y,//y
                               [ViewConstants YEAR_VIEW_WIDTH],//w
                               [ViewConstants YEAR_VIEW_HEIGHT]//h
                               );
    //make it
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setYear:yr];
        [self setBackgroundColor:[UIColor clearColor]];
        
        //put title
        UILabel* labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [ViewConstants YEAR_VIEW_WIDTH], [ViewConstants DAY_VIEW_HEIGHT])];
        [labelTitle setText:[NSString stringWithFormat:@"%d", [self year]]];
        [labelTitle setTextAlignment:UITextAlignmentCenter];
        [labelTitle setBackgroundColor:[UIColor clearColor]];
        [labelTitle setTextColor:[UIColor blackColor]];
        [labelTitle setFont:[UIFont systemFontOfSize:150]];
        [self addSubview:labelTitle];
        
        //get number of days in this month
        int monthsInYear = [DateUtils GetNumberOfMonthsInYear];
        NSLog(@"YearView: monthsInYear: %d", monthsInYear);
        
        //draw out the month
        for(int i=1; i <= monthsInYear; i++) {
            
            int x = -1;
            int y = -1;
            
            if (i <= 4) {
                
                x = [ViewConstants MONTH_VIEW_WIDTH] * (i-1);
                x = x + [ViewConstants MONTH_SPACING] * (i-1);
                
                //first row
                y = 0;
            }
            else if (i > 4 && i <= 8) {
                x = [ViewConstants MONTH_VIEW_WIDTH] * (i-5);
                x = x + [ViewConstants MONTH_SPACING] * (i-5);
                //second row
                y = [ViewConstants MONTH_VIEW_HEIGHT];
                y = y + [ViewConstants MONTH_SPACING];
            }
            else if (i > 8) {
                x = [ViewConstants MONTH_VIEW_WIDTH] * (i-9);
                x = x + [ViewConstants MONTH_SPACING] * (i-9);
                //third row
                y = [ViewConstants MONTH_VIEW_HEIGHT] * 2;
                y = y + [ViewConstants MONTH_SPACING] * 2;
            }
            //offset for title
            y = y + [ViewConstants DAY_VIEW_HEIGHT];
            
            //create  view for this day and add it
            NSLog(@"YearView: month: %d (%d,%d)", i, x, y);
            /*
            MonthView* v = [[MonthView alloc] initWithMonth:i AndYear:[self year] atX:x atY:y];
            //add it
            [self addSubview:v];
             */
        }
    }
    return self;    
}

-(CGPoint) getDateLocation:(int)day inMonth:(int)m inYear:(int)y {
    if (year == y) {
        for (UIView* v in [self subviews]) {
            if ([v isKindOfClass:[MonthView class]]) {
                MonthView* mv = (MonthView*)v;
                CGPoint pointMonth = [mv center];
                
                if ([mv month] == m) {
                    NSLog(@"Found month %d", m);
                    for(UIView* v2 in [mv subviews]) {
                        if ([v2 isKindOfClass:[DayView class]]) {
                            DayView* dv = (DayView*)v2;                            
                            if ([dv dayOfMonth] == day) {
                                //get location of day
                                CGPoint pointDay = [dv center];
                                
                                NSLog(@"YearView: getDateLocation: pointMonth: (%f, %f)", pointMonth.x, pointMonth.y);
                                NSLog(@"YearView: getDateLocation: pointDay: (%f, %f)", pointDay.x, pointDay.y);
                                
                                //return pointDay;
                                return CGPointMake(pointMonth.x + pointDay.x, pointMonth.y + pointMonth.y);
                                //return CGPointMake(400, 0);
                            }
                        }
                    }
                }
            }            
            
        }
    }
    
    return CGPointMake(0, 0);
}

+ (Class)layerClass
{
	return [CATiledLayer class];
}
 
- (void) dealloc
{
    [super dealloc];
}

@end
