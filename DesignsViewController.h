//
//  DesignsViewController.h
//  AboutMe
//
//  Created by Veeral Patel on 4/28/13.
//  Copyright (c) 2013 Veeral Patel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DesignsViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) UIPageControl * pageControl;
@property (nonatomic, retain) UILabel *info;

@end

