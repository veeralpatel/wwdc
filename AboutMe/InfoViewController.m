//
//  InfoViewController.m
//  AboutMe
//
//  Created by Veeral Patel on 4/24/13.
//  Copyright (c) 2013 Veeral Patel. All rights reserved.
//

#import "InfoViewController.h"
#import "IntroViewController.h"
#import "ImageViewController.h"
#import "FloodViewController.h"
#import "OwlViewController.h"
#import "DesignsViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

@synthesize timelineData;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.tableView.showsHorizontalScrollIndicator = NO;
        self.tableView.showsVerticalScrollIndicator = YES;
        self.tableView.bounces = YES;
        self.tableView.scrollsToTop = YES;
        self.tableView.opaque = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    float theFloat = 1.5; 
    int rounded = lroundf(theFloat); NSLog(@"%d",rounded);
    int roundedUp = ceil(theFloat); NSLog(@"%d",roundedUp);
    int roundedDown = floor(theFloat); NSLog(@"%d",roundedDown);
    
    timelineData = [[NSArray alloc] initWithObjects:
          @"Hi, I'm Veeral Patel.",
          @"A 15 year old iOS developer and designer living in New Jersey.",
          @"Here's a picture of me.", //add activity indicator
          @"Here's a picture of me, using 200 UILabels.", //add activity indicator
          @"I attend Bergenfield High School and ranked 5th in my class with a GPA of 5.654.",
          @"I started programming in the summer of 2012. I started entirely on my iPad using a neat app called Codea.",
          @"I released a simple physics game, Gravity Drop, on the day school started. It has gotten 28 downloads.", 
          @"Disappointed with the sales, I worked on a puzzle game, Flood+, and released it before Christmas break. To this day, it has 701 downloads.", //add activity indicator
          @"A new year meant a new app, so I tackled my biggest project, Owl. Owl is a simple daily fact app that was shipped to Apple a couple days ago. Unlike my other apps, this was programmed entirely in Xcode, not Codea, and will be available for free.", //add activity indicator
          @"I also tend to design projects, but never saddle up and release them. These apps are currently under development.", //add activity indicator
          @"I have no professional experience. I'm in the 10th grade, but that shouldn't be an excuse. I have a dream that all my hardwork and projects will eventually lead to an awesome job! ",
          @"The first time I saw, read, and understood code was when I started developing for iOS. I had finally found my passion. Programming.\n \nMy technical skills now involve: \n \nObjective C (obviously)\nLua \nROBOTC (C programming language for robotics) \nHTML5 \nCSS3 \nPhotoshop CS6 \nIllustrator CS6 \nInDesign CS6",
          @"When I'm not building iOS apps, you can catch me building robots with my friends, playing on my school's JV tennis team, and learning new things at Codecademy!",
          @"Thank you for your time!",
          nil];
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [timelineData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Check if a reusable cell object was dequeued
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    CGRect updateFrame = cell.textLabel.frame;
    updateFrame.size.height = [cell.textLabel.text sizeWithFont:[UIFont fontWithName:@"ProximaNova-Light" size:30]constrainedToSize:CGSizeMake(222, 1000)].height;
    cell.textLabel.frame = updateFrame;
    
    // Populate the cell with the appropriate name based on the indexPath
    cell.textLabel.text = [timelineData objectAtIndex:indexPath.row];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font=[UIFont fontWithName:@"ProximaNova-Light" size:30];
    cell.textLabel.textColor = [UIColor colorWithRed:93/255.0f green:103/255.0f blue:120/255.0f alpha:1.0f];
    cell.textLabel.highlightedTextColor = [UIColor colorWithRed:93/255.0f green:103/255.0f blue:120/255.0f alpha:1.0f];
    
    UIView *myBackView = [[UIView alloc] initWithFrame:cell.frame];
    myBackView.backgroundColor = [UIColor colorWithRed:235/255.0f green:235/255.0f blue:235/255.0f alpha:0.5f];
    cell.selectedBackgroundView = myBackView;
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    UIImage *indicator = [UIImage imageNamed:@"364.png"];
    UIButton *moreInfo = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect frame = CGRectMake(0.0, 0.0, indicator.size.width-15, indicator.size.height-15);
    moreInfo.frame = frame;	// match the button's size with the image size
    
    [moreInfo setBackgroundImage:indicator forState:UIControlStateNormal];
    
    // set the button's target to this table view controller so we can interpret touch events and map that to a NSIndexSet
    [moreInfo addTarget:self action:@selector(moreInfoTapped:event:) forControlEvents:UIControlEventTouchUpInside];
    cell.accessoryView = UITableViewCellAccessoryNone;

    
    if (indexPath.row == 2)
    {
        cell.accessoryView = moreInfo;
    } else if (indexPath.row == 3)
    {
        cell.accessoryView = moreInfo;
    } else if (indexPath.row == 7)
    {
        cell.accessoryView = moreInfo;
    } else if (indexPath.row == 8)
    {
        cell.accessoryView = moreInfo;
    } else if (indexPath.row == 9)
    {
        cell.accessoryView = moreInfo;
    }
    
    return cell;
}

- (void)moreInfoTapped:(id)sender event:(id)event
{
    NSSet *touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:self.tableView];
    
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint: currentTouchPosition];
    if (indexPath != nil)
    {
        [self tableView: self.tableView accessoryButtonTappedForRowWithIndexPath: indexPath];
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text = [timelineData objectAtIndex:indexPath.row];
    return 44 + [text sizeWithFont:[UIFont fontWithName:@"ProximaNova-Light" size:30] constrainedToSize:CGSizeMake(222, 1000)].height;
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2)
    {
        
        ImageViewController *controller = [[ImageViewController alloc] init];
        
        // If you change modalTransitionStyle, the animation is different.
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        
        
        [self presentViewController:controller animated:YES completion:nil];
        
    }
    if (indexPath.row == 3)
    {
        
        IntroViewController *controller = [[IntroViewController alloc] init];
        
        // If you change modalTransitionStyle, the animation is different.
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        
        
        [self presentViewController:controller animated:YES completion:nil];
        
    }
    if (indexPath.row == 7)
    {
        
        FloodViewController *controller = [[FloodViewController alloc] init];
        
        // If you change modalTransitionStyle, the animation is different.
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        
        
        [self presentViewController:controller animated:YES completion:nil];
        
    }
    if (indexPath.row == 8)
    {
        
        OwlViewController *controller = [[OwlViewController alloc] init];
        
        // If you change modalTransitionStyle, the animation is different.
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        
        
        [self presentViewController:controller animated:YES completion:nil];
        
    }
    if (indexPath.row == 9)
    {
        
        DesignsViewController *controller = [[DesignsViewController alloc] init];
        
        // If you change modalTransitionStyle, the animation is different.
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        
        
        [self presentViewController:controller animated:YES completion:nil];
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2)
    {
        
        ImageViewController *controller = [[ImageViewController alloc] init];
        
        // If you change modalTransitionStyle, the animation is different.
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        
        
        [self presentViewController:controller animated:YES completion:nil];
        
    }
    if (indexPath.row == 3)
    {
        
        IntroViewController *controller = [[IntroViewController alloc] init];
        
        // If you change modalTransitionStyle, the animation is different.
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        
        
        [self presentViewController:controller animated:YES completion:nil];
        
    }
    if (indexPath.row == 7)
    {
        
        FloodViewController *controller = [[FloodViewController alloc] init];
        
        // If you change modalTransitionStyle, the animation is different.
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        
        
        [self presentViewController:controller animated:YES completion:nil];
        
    }
    if (indexPath.row == 8)
    {
        
        OwlViewController *controller = [[OwlViewController alloc] init];
        
        // If you change modalTransitionStyle, the animation is different.
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        
        
        [self presentViewController:controller animated:YES completion:nil];
        
    }
    if (indexPath.row == 9)
    {
        
        DesignsViewController *controller = [[DesignsViewController alloc] init];
        
        // If you change modalTransitionStyle, the animation is different.
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        
        
        [self presentViewController:controller animated:YES completion:nil];
        
    }
}

@end
