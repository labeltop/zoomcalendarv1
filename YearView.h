//
//  YearView.h
//  ZoomCalendar
//
//  Created by hasan on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateUtils.h"
#import "MonthView.h"
#import "ViewConstants.h"

@interface YearView : UIView {
    int year;
}

@property (nonatomic, assign) int year;

-(id) initWithYear:(int)yr atX:(int)x atY:(int)y;

-(CGPoint) getDateLocation:(int)day inMonth:(int)m inYear:(int)y;

@end
