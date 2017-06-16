//
//  Utility.h
//  Giftery
//
//  Created by Anuj Panwar on 16/06/17.
//  Copyright © 2017 Mobeltech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

+ (NSDate*)dateFromString:(NSString*)aDateStr;
+ (NSString*)displayDateStringFromDate:(NSDate*)aDate;
+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime;
@end
