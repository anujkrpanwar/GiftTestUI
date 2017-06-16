//
//  TabBarController.m
//  Giftery
//
//  Created by Anuj Panwar on 16/06/17.
//  Copyright © 2017 Mobeltech. All rights reserved.
//

#import "TabBarController.h"
#import "Constants.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initialize];
}

- (void)initialize{

    [self.tabBar setTintColor:COLOR_BTN_BG_CAPTION];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: COLOR_BTN_BG_CAPTION, NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    // set color of unselected text
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    // generate a tinted unselected image based on image passed via the storyboard
    for(UITabBarItem *item in self.tabBar.items) {
        // use the UIImage category code for the imageWithColor: method
        item.image = [item.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }

    int tabWidth = self.view.frame.size.width/4;
    
    UIView *aBGView = [[UIView alloc] initWithFrame:CGRectMake(tabWidth * 2, 0, tabWidth, self.tabBar.frame.size.height)];
    aBGView.backgroundColor = COLOR_BTN_BG_ICON;
    [self.tabBar insertSubview:aBGView atIndex:0];
    
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
