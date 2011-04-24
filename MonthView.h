//
//  MonthView.h
//  ZoomCalendar
//
//  Created by hasan on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DayView.h"
#import "DateUtils.h"
#import "ViewConstants.h"

@interface MonthView : UIView {
    
    //get a specific date
    int month;
    int year;
        
}

@property (nonatomic, assign) int month;
@property (nonatomic, assign) int year;

-(id) initWithMonth:(int)month AndYear:(int)year atX:(int)x atY:(int)y;

@end
