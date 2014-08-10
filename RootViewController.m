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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.rowHeight = 80.0;
    self.tableView.separatorColor = [UIColor redColor];
    self.tableView.backgroundColor = [UIColor colorWithRed:0.6 green:0.5 blue:0.1 alpha:0.5];
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
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        // text styling (label).
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.highlightedTextColor = [UIColor redColor];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.textLabel.numberOfLines = 2; // 0 = no max
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18.0];
        cell.textLabel.shadowColor = [UIColor lightGrayColor];
        cell.textLabel.shadowOffset = CGSizeMake(1, 1);
        
        // image.
        cell.imageView.image = [self image];
        cell.imageView.contentMode = UIViewContentModeCenter;
        
        cell.imageView.layer.cornerRadius = cell.imageView.image.size.height / 2.0;
        cell.imageView.clipsToBounds = YES;
        
        
        // accessory type
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        // accessory view. Overrides accessoryType.
        cell.accessoryView = [self accessoryViewButton];
        
        // indentation.
        cell.indentationLevel = indexPath.row;
        cell.indentationWidth = 2;
        
        // separator inset.
        cell.separatorInset = UIEdgeInsetsMake(0, 60, 0, 60);
        
        // selection style
        cell.selectionStyle = UITableViewCellSelectionStyleDefault; // or UITableViewCellSelectionStyleNone
        
        // background color.
        cell.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.0 alpha:0.2];
        
        // background view and selected background view.
        UIImageView *backgroundView = [UIImageView new]; // No need to set frame.
        backgroundView.contentMode = UIViewContentModeScaleToFill;
        backgroundView.image = [UIImage imageNamed: @"flowers"];
        cell.backgroundView = backgroundView;
        
        UIView *selectedBackgroundView = [UIView new];
        selectedBackgroundView.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.0 alpha:0.6];
        cell.selectedBackgroundView = selectedBackgroundView;
        
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
