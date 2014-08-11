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

    MyCustomViewCell *myCustomCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Set up styles for all cells.

    // Configure the individual cell...
    myCustomCell.textLabel.text = [NSString stringWithFormat:@"Custom Cell! %ld", (long)indexPath.row];
    

    return myCustomCell;
}

CGFloat statusBarHeight()
{
    CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
    return MIN(statusBarSize.width, statusBarSize.height);
}

@end
