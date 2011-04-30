//
//  ViewConstants.h
//  ZoomCalendar
//
//  Created by hasan on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ViewConstants : NSObject {
    
}

+ (int) DAY_VIEW_HEIGHT;
+ (int) DAY_VIEW_WIDTH;

+ (int) MONTH_VIEW_WIDTH;
+ (int) MONTH_VIEW_HEIGHT;
+ (int) MONTH_SPACING;

+ (int) YEAR_VIEW_WIDTH;
+ (int) YEAR_VIEW_HEIGHT;

+(UIColor*) COLOR_HEADING;
+(UIColor*) COLOR_BACKGROUND;
+(UIColor*) COLOR_BORDER_DAY;

@end
