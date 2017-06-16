//
//  EventTableViewCell.h
//  Giftery
//
//  Created by Anuj Panwar on 15/06/17.
//  Copyright © 2017 Mobeltech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface EventTableViewCell : UITableViewCell

- (void)configureCell:(Event*)eventObj;

@end
