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

+(UIColor*) COLOR_HEADING {
    //return [UIColor colorWithRed:188.0/255 green:108.0/255 blue:49.0/255 alpha:1.0];
    //return [UIColor colorWithRed:255.0/255 green:153.0/255 blue:0.0/255 alpha:1.0];
    return [UIColor colorWithRed:133.0/255 green:184.0/255 blue:224.0/255 alpha:1.0];    
}

+(UIColor*) COLOR_BACKGROUND {
    return [UIColor colorWithRed:66.0/255 green:66.0/255 blue:66.0/255 alpha:1.0];   
}

+(UIColor*) COLOR_BORDER_DAY {
    return [UIColor colorWithRed:170.0/255 green:255.0/255 blue:125.0/255 alpha:1.0];   
}

@end
