//
//  Event.m
//  Giftery
//
//  Created by Anuj Panwar on 15/06/17.
//  Copyright © 2017 Mobeltech. All rights reserved.
//

#import "Event.h"
#import "Constants.h"
#import "Utility.h"

@implementation Event

@synthesize name;
@synthesize occassion;
@synthesize date;
@synthesize isGifted;

- (id)initWithDictionary:(NSDictionary*)mDict{
    
    if(self = [super init]){
//        NSNumber* amt = [Utility getNumberFromObject:[mDict objectForKey:@"amount"]];
        self.name = STRING_CHECK([mDict objectForKey:@"Name"]);
        self.occassion = STRING_CHECK([mDict objectForKey:@"Occasion"]);
        self.date = [Utility dateFromString:STRING_CHECK([mDict objectForKey:@"Date"])];
        self.isGifted = [self getBoolFromString:STRING_CHECK([mDict objectForKey:@"Gifted"])];
    }
    return self;
}


- (BOOL)getBoolFromString:(NSString*)boolStr{

    if ([boolStr length] == 0) {
        return FALSE;
    }
    
    if ([boolStr isEqualToString:@"TRUE"]) {
        return TRUE;
    } else {
        return FALSE;
    }

}

@end
