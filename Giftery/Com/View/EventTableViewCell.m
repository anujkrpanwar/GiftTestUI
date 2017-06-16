//
//  EventTableViewCell.m
//  Giftery
//
//  Created by Anuj Panwar on 15/06/17.
//  Copyright © 2017 Mobeltech. All rights reserved.
//

#import "EventTableViewCell.h"
#import "Utility.h"
#import "Constants.h"

@interface EventTableViewCell()

@property (nonatomic, weak) IBOutlet UIView* baseView;
@property (nonatomic, weak) IBOutlet UIView* giftView;
@property (nonatomic, weak) IBOutlet UIView* doneView;
@property (nonatomic, weak) IBOutlet UILabel* nameLabel;
@property (nonatomic, weak) IBOutlet UILabel* occassionLabel;
@property (nonatomic, weak) IBOutlet UILabel* dateLabel;
@property (nonatomic, weak) IBOutlet UILabel* daysLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *occassionHeight;

@end

@implementation EventTableViewCell

- (void)awakeFromNib{
    [super awakeFromNib];
    // Initialization code
    [self initialize];
}

- (void)initialize{
    
//    self.baseView = [ViewUtility resizeableImageWithCapInsets:@"NoticeCellBg" insets:UIEdgeInsetsMake(40, 100, 40, 100)];
    
    self.baseView = [self setShadow:self.baseView];
    self.giftView.layer.cornerRadius = 21;
    self.doneView.layer.cornerRadius = 21;
    
    self.nameLabel.textColor = COLOR_CELL_TITLE;
    self.occassionLabel.textColor = COLOR_CELL_SUB_TITLE;
    self.dateLabel.textColor = COLOR_CELL_TITLE;
    self.daysLabel.textColor = COLOR_CELL_SUB_TITLE;
}

- (UIView*)setShadow:(id)view{
    UIView *tempView = view;
    tempView.layer.shadowColor = [[UIColor colorWithWhite:0.0 alpha:0.4f] CGColor];
    tempView.layer.shadowOffset = CGSizeMake(0, 1);
    tempView.layer.shadowOpacity = 2;
    tempView.layer.shadowRadius = 1.5;
    tempView.clipsToBounds = NO;
    
    return tempView;
}

- (void)configureCell:(Event*)eventObj{

    self.nameLabel.text = eventObj.name;
    
    if(eventObj.isGifted) {
        self.giftView.hidden = YES;
        self.doneView.hidden = NO;
        self.baseView.backgroundColor = COLOR_CELL_BG_SEL;
        self.nameLabel.textColor = COLOR_CELL_TITLE_SEL;
        self.occassionLabel.textColor = COLOR_CELL_SUB_TITLE;
        self.dateLabel.textColor = COLOR_CELL_TITLE_SEL;
        self.daysLabel.textColor = COLOR_CELL_SUB_TITLE;
    } else {
        self.giftView.hidden = NO;
        self.doneView.hidden = YES;
        self.baseView.backgroundColor = [UIColor whiteColor];
        self.nameLabel.textColor = COLOR_CELL_TITLE;
        self.occassionLabel.textColor = COLOR_CELL_SUB_TITLE;
        self.dateLabel.textColor = COLOR_CELL_TITLE;
        self.daysLabel.textColor = COLOR_CELL_SUB_TITLE;
    }
    
    if([eventObj.name length] == 0){
    
        self.nameLabel.text = eventObj.occassion;
        self.occassionLabel.hidden = YES;
        self.occassionHeight.constant = 0.0f;
    
    } else {
        
        self.occassionLabel.hidden = NO;
        self.occassionLabel.text = eventObj.occassion;
        self.occassionHeight.constant = 14.0f;
    }
    
    self.dateLabel.text = [Utility displayDateStringFromDate:eventObj.date];
    
    NSInteger days = [Utility daysBetweenDate:[NSDate date] andDate:eventObj.date];
    
    self.daysLabel.textColor = COLOR_CELL_SUB_TITLE;
    
    if(days < 0){
        self.daysLabel.text = @"Expired";
        self.daysLabel.textColor = [UIColor redColor];
    } else {
        
        if(days/30 >= 1){
            self.daysLabel.text = [NSString stringWithFormat:@"in %ld months", (long)days/30];
        } else {
            self.daysLabel.text = [NSString stringWithFormat:@"in %ld days", (long)days];
            
            if (days < 15) {
                self.daysLabel.textColor = COLOR_CELL_SUB_TITLE_2;
            }
        }
        
    }
    
    
    
}


@end
