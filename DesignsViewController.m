//
//  DesignsViewController.m
//  AboutMe
//
//  Created by Veeral Patel on 4/28/13.
//  Copyright (c) 2013 Veeral Patel. All rights reserved.
//

#import "DesignsViewController.h"

@interface DesignsViewController ()

@end

@implementation DesignsViewController


#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupScrollView];
    
    
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];

    if (screenBounds.size.height == 568) {
        _info = [ [UILabel alloc ] initWithFrame:CGRectMake(0.0, 500.0, 320.0, 50.0) ];
        _info.textAlignment =  UITextAlignmentCenter;
        _info.textColor = [UIColor whiteColor];
        _info.text = @"CALENDAR";
        _info.font = [UIFont fontWithName:@"ProximaNova-Black" size:20];
        _info.backgroundColor = [UIColor colorWithRed:93/255.0f green:103/255.0f blue:120/255.0f alpha:0.75f];
        [self.view addSubview:_info];
        
        
        self.pageControl = [[UIPageControl alloc] init];
        self.pageControl.frame = CGRectMake(110,489,100,100);
        self.pageControl.numberOfPages = 5;
        self.pageControl.currentPage = 0;
        [self.view addSubview:self.pageControl];
    } else {
        _info = [ [UILabel alloc ] initWithFrame:CGRectMake(0.0, 411.0, 320.0, 50.0) ];
        _info.textAlignment =  UITextAlignmentCenter;
        _info.textColor = [UIColor whiteColor];
        _info.text = @"CALENDAR";
        _info.font = [UIFont fontWithName:@"ProximaNova-Black" size:20];
        _info.backgroundColor = [UIColor colorWithRed:93/255.0f green:103/255.0f blue:120/255.0f alpha:0.75f];
        [self.view addSubview:_info];
        
        
        self.pageControl = [[UIPageControl alloc] init];
        self.pageControl.frame = CGRectMake(110,401,100,100);
        self.pageControl.numberOfPages = 5;
        self.pageControl.currentPage = 0;
        [self.view addSubview:self.pageControl];
    }
}

-(void) setupScrollView {
    //add the scrollview to the view
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,
                                                                         self.view.frame.size.width,
                                                                         self.view.frame.size.height)];
        self.scrollView.pagingEnabled = YES;
        [self.scrollView setAlwaysBounceVertical:NO];
        //setup internal views
        NSInteger numberOfViews = 5;
        for (int i = 0; i < numberOfViews; i++) {
            CGFloat xOrigin = i * self.view.frame.size.width;
            UIImageView *image = [[UIImageView alloc] initWithFrame:
                                  CGRectMake(xOrigin, 0,
                                             self.view.frame.size.width,
                                             self.view.frame.size.height)];
            image.image = [UIImage imageNamed:[NSString stringWithFormat:
                                               @"D_%d", i+1]];
            image.contentMode = UIViewContentModeScaleToFill;
            [self.scrollView addSubview:image];
        }
        
        //set the scroll view content size
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width *
                                                 numberOfViews,
                                                 self.view.frame.size.height);
        
        [self.scrollView setBackgroundColor:[UIColor blackColor]];
        
        
        
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.delegate = self;
        
        
        //add the scrollview to this view
        [self.view addSubview:self.scrollView];
    } else {
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,
                                                                         self.view.frame.size.width,
                                                                         self.view.frame.size.height)];
        self.scrollView.pagingEnabled = YES;
        [self.scrollView setAlwaysBounceVertical:NO];
        //setup internal views
        NSInteger numberOfViews = 5;
        for (int i = 0; i < numberOfViews; i++) {
            CGFloat xOrigin = i * self.view.frame.size.width;
            UIImageView *image = [[UIImageView alloc] initWithFrame:
                                  CGRectMake(xOrigin, 0,
                                             320,
                                             460)];
            image.image = [UIImage imageNamed:[NSString stringWithFormat:
                                               @"D4_%d", i+1]];
            image.contentMode = UIViewContentModeScaleToFill;
            [self.scrollView addSubview:image];
        }
        
        //set the scroll view content size
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width *
                                                 numberOfViews,
                                                 self.view.frame.size.height);
        
        [self.scrollView setBackgroundColor:[UIColor blackColor]];
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.delegate = self;
        
        
        //add the scrollview to this view
        [self.view addSubview:self.scrollView];
    }
    
    
}



- (void)scrollViewDidScroll:(UIScrollView *)sender {
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    NSLog(@"You are on page #%d", page);
    
    self.pageControl.currentPage = page;
    
    if (page == 1) {
        _info.text = @"WEATHER";
    } else if (page == 2) {
        _info.text = @"COUNTDOWN";
    } else if (page == 3) {
        _info.text = @"COUNTDOWN ALT.";
    } else if (page == 4)
    {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
}

@end