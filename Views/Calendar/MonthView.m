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

-(id) initAtX:(int)x atY:(int)y {
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
        
        //show month title
        CGRect labelTitleFrame = CGRectMake(0, 0, [ViewConstants MONTH_VIEW_WIDTH], [ViewConstants DAY_VIEW_HEIGHT]);
        labelTitle = [[UILabel alloc] initWithFrame:labelTitleFrame];
        [labelTitle setTextAlignment:UITextAlignmentCenter];
        [labelTitle setFont:[UIFont systemFontOfSize:80]];
        [labelTitle setTextColor:[ViewConstants COLOR_HEADING]];
        [labelTitle setBackgroundColor:[UIColor clearColor]];
        [self addSubview:labelTitle];
        
        //calc offset
        int yOffset = [ViewConstants DAY_VIEW_HEIGHT];
        
        //put day labels
        int numberOfDaysInWeek = [DateUtils GetNumberOfdaysInWeek];
        int dayOfWeek=1;
        for(dayOfWeek=1; dayOfWeek <= numberOfDaysInWeek; dayOfWeek++) {
            //its all at the top
            int y = yOffset;
            
            //get x
            int x = [ViewConstants DAY_VIEW_WIDTH] * (dayOfWeek-1);
            NSLog(@"      MonthView: i %d: %d,%d", dayOfWeek,x,y);
            
            //create  view for this day and add it
            DayView* v = [[DayView alloc] initAtX:x atY:y];
            [v setWeekLabel:[DateUtils GetDayOfWeekTitle:dayOfWeek]];
            [self addSubview:v];
        }
        
        //we will save them for later use
        int maxVisibleDayViews = 42; //6 weeks
        dayViews = [[NSMutableArray alloc] initWithCapacity:maxVisibleDayViews];
        
        //create max number of day labels   
        int weekOfMonth = 0;
        dayOfWeek=1;
        int day = 1;
        int x = -1;
        int y = -1;
        //loop and create 31 day views
        do {
            
            //get x, offset by -1 so its flush on left side
            x = [ViewConstants DAY_VIEW_WIDTH] * (dayOfWeek - 1);
            
            //
            y = ([ViewConstants DAY_VIEW_HEIGHT] * weekOfMonth) + (2 * [ViewConstants DAY_VIEW_HEIGHT]);
            NSLog(@"      MonthView: day %d (%d): %d,%d", day, dayOfWeek, x, y);
            
            
            //create  view for this day and add it
            DayView* dv = [[DayView alloc] initAtX:x atY:y];
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
            
            //save a ref to this 
            [dayViews addObject:dv];
            
        } while (day <= maxVisibleDayViews);    
        
    }
    return self;    
}

-(void) setMonth:(int)m inYear:(int)yr {
    [self setMonth:m];
    [self setYear:yr];
    
    //set month title
    [labelTitle setText:[NSString stringWithFormat:@"%@, %d", [DateUtils GetMonthTitle:[self month]], [self year]]];
        
    //loop and clean all
    [self clear];
    
    //figure out whats day of week for 1st of month, this will be first dayview to use from array
    int indexDayView = [DateUtils GetDayfWeek:1 inMonth:[self month] inYear:[self year]];
    //offset by 1 because stupid array starts at 0
    indexDayView--;
        
    //figure out number of days in this month
    int maxDaysInMonth = [DateUtils GetNumberOfDaysInMonth:[self month] inYear:[self year]];
    
    //this is where we start
    for(int dayOfMonth = 1; dayOfMonth <= maxDaysInMonth; dayOfMonth++) {
        
        //show it
        DayView* v = [dayViews objectAtIndex:indexDayView];
        [v setDate:dayOfMonth inMonth:[self month] inYear:[self year]];
        
        //go to next cell
        indexDayView++;
    }
    
    //load events
    [self load];
}

- (void)dealloc
{
    [super dealloc];
}

-(void) load {
    NSLog(@"MonthView: load: start");
    
    for (int i=0; i < [dayViews count]; i++) {
        DayView* v = [dayViews objectAtIndex:i];
        [v clearEvents];
    }

    
    //get db
    DBStorage* store = [DBStorage GetInstance];
    GoogleCalendar* gc = [GoogleCalendar GetInstance];
    
    //get calendar accounts
    NSArray* calendarAccounts = [store getCalendarAccounts];
    NSLog(@"MonthView: load: calendarAccounts: %@", calendarAccounts);
    for (CalendarAccount* ca in calendarAccounts) {
        
        //get calendars for this account
        NSArray* calendars = [store getCalendarsForAccount:ca];
        NSLog(@"MonthView: load: calendars: %@", calendars);
        for(Calendar* c in calendars) {
            
            //get events
            [gc getCalendarEventsForAccount:ca inCalendar:c forHolder:self];
        }
    }
    NSLog(@"MonthView: load: end");
}

-(void) clear {
    NSLog(@"MonthView: clear: start");
    for (int i=0; i < [dayViews count]; i++) {
        DayView* v = [dayViews objectAtIndex:i];
        [v clearDate];
        [v clearEvents];
    }
    NSLog(@"MonthView: clear: end");
}

-(void) setCalendarEvents:(NSMutableArray*) events {
    NSLog(@"%@", events);
}

@end
