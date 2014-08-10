//
//  RootViewController.m
//  Table_Views_and_Collection_Views
//
//  Created by Daniel Wallace on 10/08/14.
//  Copyright (c) 2014 nz.co.danielw. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController



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
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        // text styling (label).
        cell.textLabel.textColor = [UIColor orangeColor];
        cell.textLabel.highlightedTextColor = [UIColor redColor];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.textLabel.numberOfLines = 2; // 0 = no max
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18.0];
        cell.textLabel.shadowColor = [UIColor lightGrayColor];
        cell.textLabel.shadowOffset = CGSizeMake(1, 1);
        
        // image.
        cell.imageView.image = [self image];
        cell.imageView.contentMode = UIViewContentModeCenter;
        
        // accessory type
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        // accessory view. Overrides accessoryType.
        cell.accessoryView = [self accessoryViewButton];
        
    }
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"Hello there!\n %ld", (long)indexPath.row];
    return cell;
}


-(void) tap:(UIButton *)button
{
    NSLog(@"Accessory view button tapped %@", button);
}

-(UIButton *)accessoryViewButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Tap Me" forState:UIControlStateNormal];
    [button sizeToFit];
//    [button targetForAction:@selector(tap:) withSender:button];
    [button addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
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
