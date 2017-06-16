//
//  EventViewController.m
//  Giftery
//
//  Created by Anuj Panwar on 15/06/17.
//  Copyright © 2017 Mobeltech. All rights reserved.
//

#import "EventViewController.h"
#import "DataManager.h"
#import "EventTableViewCell.h"
#import "Event.h"

@interface EventViewController ()<DataManagerDelegate>

@property (nonatomic, weak) IBOutlet UITableView* mTableView;
@property (nonatomic, weak) IBOutlet UIView* mAddView;
@property (nonatomic, strong) NSArray *eventArray;

@end

@implementation EventViewController

@synthesize mTableView;
@synthesize eventArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mAddView.layer.cornerRadius = 33;
    self.automaticallyAdjustsScrollViewInsets = false;
}

- (void)viewWillAppear:(BOOL)animated{
 
    if([DataManager getInstance].eventData == nil){
    
        [DataManager getInstance].delegate = self;
        [[DataManager getInstance] getEvents];
    } else {
        [self.mTableView reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.eventArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}

- (CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0;
}

- (CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return nil;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath{
    
    EventTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"EventTableViewCell"];
    
    cell.backgroundColor = [UIColor clearColor];
    
    Event *anEvent = [self.eventArray objectAtIndex:indexPath.row];
    [cell configureCell:anEvent];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - DataManager Delegate Methods

- (void)getEventSuccess{

    self.eventArray = [DataManager getInstance].eventData;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.mTableView reloadData];
    });
    
}

- (void)getEventFailedWithMessage:(NSString*)message{


}


@end
