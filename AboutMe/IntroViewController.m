//
//  IntroViewController.m
//  AboutMe
//
//  Created by Veeral Patel on 4/26/13.
//  Copyright (c) 2013 Veeral Patel. All rights reserved.
//

#import "IntroViewController.h"

@interface IntroViewController ()

@end

@implementation IntroViewController {}


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
    // Do any additional setup after loading the view from its nib.
    
     UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
     
     [button setImage:[UIImage imageNamed:@"422.png"] forState:UIControlStateNormal];
     
     CGRect screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568) {
        button.frame = CGRectMake(5, 0, 32, 32);

        UILabel *info = [ [UILabel alloc ] initWithFrame:CGRectMake(0.0, 500.0, 320.0, 50.0) ];
        info.textAlignment =  UITextAlignmentCenter;
        info.text = @"THIS TOOK ME 4 HOURS.";
        info.textColor = [UIColor whiteColor];
        info.font = [UIFont fontWithName:@"ProximaNova-Black" size:20];
        info.backgroundColor = [UIColor colorWithRed:93/255.0f green:103/255.0f blue:120/255.0f alpha:0.75f];
        [self.view addSubview:info];
        
    } else {
        button.frame = CGRectMake(5, 0, 32, 32);
        
        UILabel *info = [ [UILabel alloc ] initWithFrame:CGRectMake(0.0, 411.0, 320.0, 50.0) ];
        info.textAlignment =  UITextAlignmentCenter;
        info.text = @"THIS TOOK ME 4 HOURS.";
        info.textColor = [UIColor whiteColor];
        info.font = [UIFont fontWithName:@"ProximaNova-Black" size:20];
        info.backgroundColor = [UIColor colorWithRed:93/255.0f green:103/255.0f blue:120/255.0f alpha:0.75f];
        [self.view addSubview:info];
    }
    
     
     
     [button addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
     
     [self.view addSubview:button];
}

-(IBAction)close:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
