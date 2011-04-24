//
//  DayView.h
//  ZoomCalendar
//
//  Created by hasan on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateUtils.h"
#import "ViewConstants.h"

@interface DayView : UIView <UIGestureRecognizerDelegate> {
    int dayOfMonth;
    int month;
    int year;
}

@property (nonatomic, assign) int dayOfMonth;
@property (nonatomic, assign) int month;
@property (nonatomic, assign) int year;

-(id) initWithDate:(int)d inMonth:(int)m inYear:(int)yr  atX:(int)x atY:(int)y;
-(id) initWithLabel:(NSString*)str atX:(int)x atY:(int)y;

-(void) create:(NSString*)str;
- (void)handleDoubleTap:(UITapGestureRecognizer *)sender;
- (void)handleSingleTap:(UITapGestureRecognizer *)sender;

@end
