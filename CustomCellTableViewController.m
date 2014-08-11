//
//  RootViewController.m
//  Table_Views_and_Collection_Views
//
//  Created by Daniel Wallace on 10/08/14.
//  Copyright (c) 2014 nz.co.danielw. All rights reserved.
//

#import "CustomCellTableViewController.h"
#import "MyCustomViewCell.h"

@interface CustomCellTableViewController ()

@end

@implementation CustomCellTableViewController

static NSString *CellIdentifier = @"CustomCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[MyCustomViewCell class]
           forCellReuseIdentifier:CellIdentifier];
    
    [self.tableView setContentInset:UIEdgeInsetsMake(statusBarHeight(), 0, self.tabBarController.tabBar.frame.size.height, 0)];
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
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    MyCustomViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Set up styles for all cells.

    // image.
    cell.imageView.image = [self image];
    cell.imageView.contentMode = UIViewContentModeCenter;
    
    cell.imageView.layer.cornerRadius = cell.imageView.image.size.height / 2.0;
    cell.imageView.clipsToBounds = YES;
    
    // accessory type
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // Configure the individual cell...
    cell.textLabel.text = [NSString stringWithFormat:@"Custom Cell! %ld", (long)indexPath.row];
    

    return cell;
}

CGFloat statusBarHeight()
{
    CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
    return MIN(statusBarSize.width, statusBarSize.height);
}

-(UIImage *) image
{
    CGFloat side = 30;
    UIImage *originalImage = [UIImage imageNamed:@"smiley"];
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(side,side), YES, 0);
    [originalImage drawInRect:CGRectMake(0, 0, side, side)];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resizedImage;
}

@end
