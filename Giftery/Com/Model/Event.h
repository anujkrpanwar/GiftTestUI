//
//  Event.h
//  Giftery
//
//  Created by Anuj Panwar on 15/06/17.
//  Copyright © 2017 Mobeltech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSString* occassion;
@property(nonatomic, strong) NSDate* date;
@property(nonatomic, assign) BOOL isGifted;

- (id)initWithDictionary:(NSDictionary*)mDict;

@end
