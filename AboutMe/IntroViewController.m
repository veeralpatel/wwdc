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

@implementation IntroViewController

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
    } else {
        button.frame = CGRectMake(5, 0, 32, 32);
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
