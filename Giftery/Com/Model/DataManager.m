//
//  DataManager.m
//  Giftery
//
//  Created by Anuj Panwar on 15/06/17.
//  Copyright © 2017 Mobeltech. All rights reserved.
//

#import "DataManager.h"
#import "Event.h"

static DataManager* ownInstance = nil;

@implementation DataManager


- (id)init{
    
    @synchronized(self){
        if(ownInstance == nil){
            
            ownInstance = [super init];
            self = ownInstance;
            
            [self initializeData];
            
            return ownInstance;
        }
    }
    
    return nil;
}

+ (DataManager*)getInstance{
    
    @synchronized(self){
        if(ownInstance == nil){
            
            return [[self alloc] init];
        }
    }
    
    return ownInstance;
}

- (void)initializeData{
    
    
}


#pragma mark - Event Methods

- (void)getEvents{

    NSArray *response = [self readEventsFromFile];
    NSLog(@"%@ :: %@ :: %@", self, NSStringFromSelector(_cmd), response);
    
    if (response == nil) {
        if(self.delegate && [self.delegate respondsToSelector:@selector(getEventFailedWithMessage:)])
            [self.delegate getEventFailedWithMessage:@"No Data Available"];
    }
    
    [DataManager getInstance].eventData = [self parseEventResponse:response];
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(getEventSuccess)])
        [self.delegate getEventSuccess];
}


- (id)readEventsFromFile{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"jsonresponse" ofType:@"txt"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}


- (NSMutableArray*)parseEventResponse:(NSArray*)response{
    
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    for (int anIndex = 0; anIndex < [response count]; anIndex++) {
        
        NSDictionary *dict = [response objectAtIndex:anIndex];
        Event *anEvent = [[Event alloc] initWithDictionary:dict];
        [dataArray addObject:anEvent];
    }

    return dataArray;
}

@end
