//
//  MainViewController.m
//  FBCircle
//
//  Created by 史忠坤 on 14-5-6.
//  Copyright (c) 2014年 szk. All rights reserved.
//


#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "GpersonallSettingViewController.h"

#import "MainViewController.h"
#import "JSONKit.h"
#import "LoginViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    LoginViewController *loginV=[[LoginViewController alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:loginV];
    
   // [self presentViewController:nav animated:YES completion:NULL];
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    
NSMutableArray *AddressbookArr   = [SzkAPI AccesstoAddressBookAndGetDetail];
    
    
    NSLog(@"AddressbookArr===%@",AddressbookArr);
    
    [self setupLeftMenuButton];
    [self setupRightMenuButton];
    
    
	// Do any additional setup after loading the view.
}

-(void)setupLeftMenuButton{
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
}

-(void)setupRightMenuButton{
    MMDrawerBarButtonItem * rightDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(rightDrawerButtonPress:)];
    [self.navigationItem setRightBarButtonItem:rightDrawerButton animated:YES];
}
#pragma mark - Button Handlers
-(void)leftDrawerButtonPress:(id)sender{
    
    
    
    GpersonallSettingViewController *_personalVC=[[GpersonallSettingViewController alloc]init];
    [self.navigationController pushViewController:_personalVC animated:YES];
//
//[self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

-(void)rightDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
