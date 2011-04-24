//
//  CalendarScroll.h
//  ZoomCalendar
//
//  Created by hasan on 4/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YearView.h"

@interface CalendarScroll : UIScrollView <UIScrollViewDelegate> {
    //state of current zoom
    float currentZoom;
    
    //content
    YearView* content;
}

-(void) scrollToDate:(NSDate*)d;

@end
