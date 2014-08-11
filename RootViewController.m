//
//  RootViewController.m
//  Table_Views_and_Collection_Views
//
//  Created by Daniel Wallace on 10/08/14.
//  Copyright (c) 2014 nz.co.danielw. All rights reserved.
//

#import "RootViewController.h"
#import "MyCell.h"

@interface RootViewController ()

@end

@implementation RootViewController

static NSString *CellIdentifier = @"Cell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
//    [self.tableView registerClass:[UITableViewCell class]
//           forCellReuseIdentifier:CellIdentifier];
    
    [self.tableView registerClass:[MyCell class]
           forCellReuseIdentifier:CellIdentifier];
    
    
    self.tableView.rowHeight = 80.0;
    self.tableView.separatorColor = [UIColor redColor];
    self.tableView.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.0 alpha:0.6];

    // tableHeaderView
    UIView *tableHeaderView = [UIView new];
    tableHeaderView.backgroundColor = [UIColor colorWithRed:0.5 green:0.3 blue:0.0 alpha:0.2];
    tableHeaderView.bounds = CGRectMake(0, 0, 0, 60.0);
    self.tableView.tableHeaderView = tableHeaderView;
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(tableHeaderView.bounds) - 50.0f, 10.0f, tableHeaderView.bounds.size.width - 20.0, tableHeaderView.bounds.size.height - 20.0)];
    headerLabel.text = @"tableHeaderView";
    [tableHeaderView addSubview:headerLabel];
    
    // tableFooterView
    UIView *tableFooterView = [UIView new];
    tableFooterView.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.1 alpha:0.4];
    tableFooterView.bounds = CGRectMake(0, 0, 0, 60.0);
    self.tableView.tableFooterView = tableFooterView;
    
    UILabel *footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(tableHeaderView.bounds) - 50.0f, 10.0f, tableHeaderView.bounds.size.width - 20.0, tableHeaderView.bounds.size.height - 20.0)];
    footerLabel.text = @"tableFooterView";
    [tableFooterView addSubview:footerLabel];
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

-(UITableViewCell *) getCellVersionOneWithIdentifier:(NSString *)cellIdentifier forTableView:(UITableView *)tableView
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    return cell;
}

//-(UITableViewCell *) getCellVersionOneWithIdentifier:(NSString *)cellIdentifier forTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
//    return cell;
//}

-(MyCell *) getCellVersionOneWithIdentifier:(NSString *)cellIdentifier forTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath
{
    MyCell *myCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    return myCell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    static NSString *CellIdentifier = @"Cell";
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    UITableViewCell *cell = [self getCellVersionOneWithIdentifier:CellIdentifier forTableView:tableView];
    
    // Need to register cell for the next one to work.
//    UITableViewCell *cell = [self getCellVersionOneWithIdentifier:CellIdentifier forTableView:tableView forIndexPath:indexPath];
    MyCell *cell = [self getCellVersionOneWithIdentifier:CellIdentifier forTableView:tableView forIndexPath:indexPath];
    
    // Don't need this conditional logic when registering the cell and calling tableView dequeueReusableCellWithIdentifier:forIndexPath:
//    if(cell == nil){
//        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    
        // Set up styles for all cells.
    
        // text styling (label).
#warning implement this conditional logic for all cell properties.
        if(![cell.textLabel.textColor isEqual: [UIColor whiteColor]]){
            cell.textLabel.textColor = [UIColor whiteColor];
            NSLog(@"initializing a cell");
        }else{
            NSLog(@"reusing a cell");
        }
        cell.textLabel.highlightedTextColor = [UIColor redColor];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.textLabel.numberOfLines = 0; // 0 = no max
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
    
        cell.detailTextLabel.text = @"SUB TITLE";
        cell.detailTextLabel.textColor = [UIColor whiteColor];
    
//    }
    // Configure the individual cell...
    cell.textLabel.text = [NSString stringWithFormat:@"Hello there! %ld", (long)indexPath.row];
    

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
