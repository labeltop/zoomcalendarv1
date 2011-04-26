//
//  ViewConstants.m
//  ZoomCalendar
//
//  Created by hasan on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewConstants.h"


@implementation ViewConstants

+ (int) DAY_VIEW_WIDTH {
    return 300;
}

+ (int) DAY_VIEW_HEIGHT {
    return 300;
}

+ (int) MONTH_VIEW_WIDTH {
    return 2100;
}

//title + weekday header + 6 weeks
+ (int) MONTH_VIEW_HEIGHT {
    return 2400;
}

+ (int) MONTH_SPACING {
    return 20;
}

+ (int) YEAR_VIEW_WIDTH {
    return 8460;
}

//number of months in a column + paddings + year title
+ (int) YEAR_VIEW_HEIGHT {
    return 7560;
}

@end
