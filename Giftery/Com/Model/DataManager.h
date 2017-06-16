//
//  DataManager.h
//  Giftery
//
//  Created by Anuj Panwar on 15/06/17.
//  Copyright © 2017 Mobeltech. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataManagerDelegate <NSObject>

@optional
- (void)getEventSuccess;
- (void)getEventFailedWithMessage:(NSString*)message;

@end

@interface DataManager : NSObject

@property (nonatomic, weak) id<DataManagerDelegate> delegate;
@property (nonatomic, strong) NSArray* eventData;

+ (DataManager*)getInstance;
- (void)getEvents;

@end
