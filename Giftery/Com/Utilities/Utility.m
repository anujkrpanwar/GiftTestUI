//
//  Utility.m
//  Giftery
//
//  Created by Anuj Panwar on 16/06/17.
//  Copyright © 2017 Mobeltech. All rights reserved.
//

#import "Utility.h"

@implementation Utility

static NSDateFormatter *dateUIFormatter = nil;
static NSDateFormatter *dateFormatter = nil;

+ (NSDateFormatter*)dateUIDF{
    
    if(dateUIFormatter == nil){
        dateUIFormatter = [[NSDateFormatter alloc] init];
        [dateUIFormatter setDateFormat:@"dd MMM"];
    }
    return dateUIFormatter;
}


+ (NSDateFormatter*)dateDF{
    
    if(dateFormatter == nil){
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    }
    return dateFormatter;
}

+ (NSDate*)dateFromString:(NSString*)aDateStr{
    
    if(aDateStr == nil || [aDateStr length] == 0)
        return nil;
    
    NSDate *aDate = [[Utility dateDF] dateFromString:aDateStr];
    return aDate;
}


+ (NSString*)displayDateStringFromDate:(NSDate*)aDate{
    
    if(aDate == nil)
        return @"";
    
    NSString *dateUIStr = [[Utility dateUIDF] stringFromDate:aDate];
    return dateUIStr;
}

+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime{
    
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&fromDate
                 interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&toDate
                 interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSCalendarUnitDay
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
}

@end
