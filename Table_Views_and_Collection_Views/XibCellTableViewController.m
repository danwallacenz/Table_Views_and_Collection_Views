//
//  XibCellTableViewController.m
//  Table_Views_and_Collection_Views
//
//  Created by Daniel Wallace [DATACOM] on 11/08/14.
//  Copyright (c) 2014 nz.co.danielw. All rights reserved.
//

#import "XibCellTableViewController.h"
#import "XibCell.h"

@interface XibCellTableViewController ()

@end

@implementation XibCellTableViewController

static NSString *CellIdentifier = @"XibCell";


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    [self.tableView registerNib:[UINib nibWithNibName: CellIdentifier bundle:nil] forCellReuseIdentifier:CellIdentifier];
    
    [self.tableView setContentInset:UIEdgeInsetsMake([DWDeviceUtils statusBarHeight], 0, self.tabBarController.tabBar.frame.size.height, 0)];
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
    XibCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    UILabel *label = cell.theLabel;
    label.text = [NSString stringWithFormat:@"Hello there! %ld", (long)indexPath.row];
    UIImageView *imageView = cell.theImageView;
    imageView.image = [self image];
    
    return cell;
}

-(UIImage *) image
{
    CGFloat side = 30;
    UIImage *originalImage = [UIImage imageNamed:@"smiley-transparent-BG"];
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(side,side), NO, 0);
    [originalImage drawInRect:CGRectMake(0, 0, side, side)];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resizedImage;
}


@end
