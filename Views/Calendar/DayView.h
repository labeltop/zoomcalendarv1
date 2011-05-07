//
//  DayView.h
//  ZoomCalendar
//
//  Created by hasan on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "DateUtils.h"
#import "ViewConstants.h"

@interface DayView : UIView <UIGestureRecognizerDelegate> {
    int dayOfMonth;
    int month;
    int year;
    BOOL hasDate;
}

@property (nonatomic, assign) BOOL hasDate;
@property (nonatomic, assign) int dayOfMonth;
@property (nonatomic, assign) int month;
@property (nonatomic, assign) int year;

-(id) initAtX:(int)x atY:(int)y;

-(void) setDate:(int)d inMonth:(int)m inYear:(int)y;
-(void) setWeekLabel:(NSString*)str;

-(void) clearDate;
-(void) clearEvents;

-(void)handleDoubleTap:(UITapGestureRecognizer *)sender;
-(void)handleSingleTap:(UITapGestureRecognizer *)sender;

@end
