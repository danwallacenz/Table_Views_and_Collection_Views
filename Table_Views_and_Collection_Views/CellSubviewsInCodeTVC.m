//
//  CellSubviewsInCodeTVC.m
//  Table_Views_and_Collection_Views
//
//  Created by Daniel Wallace [DATACOM] on 11/08/14.
//  Copyright (c) 2014 nz.co.danielw. All rights reserved.
//

#import "CellSubviewsInCodeTVC.h"

@interface CellSubviewsInCodeTVC ()

@end

@implementation CellSubviewsInCodeTVC

static NSString *CellIdentifier = @"CellWithSubviewsInCode";


- (void)viewDidLoad
{
    [super viewDidLoad];

    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:CellIdentifier];
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    if(![cell viewWithTag:1]){
        
        UIImageView *imageView = [UIImageView new];
        imageView.tag = 1;
        [cell.contentView addSubview:imageView];
        
        UILabel *label = [UILabel new];
        label.tag = 2;
        [cell.contentView addSubview:label];
        
        // Position using constraints.
        NSDictionary *bindings = NSDictionaryOfVariableBindings(imageView, label);
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        label.translatesAutoresizingMaskIntoConstraints = NO;
        
        // imageView is vertically centered
        [cell.contentView addConstraint: [NSLayoutConstraint constraintWithItem:imageView
                                                                      attribute:NSLayoutAttributeCenterY
                                                                      relatedBy:0
                                                                         toItem:cell.contentView
                                                                      attribute:NSLayoutAttributeCenterY
                                                                     multiplier:1
                                                                       constant:0]];
        
        // It's a square.
        [cell.contentView addConstraint: [NSLayoutConstraint constraintWithItem:imageView
                                                                      attribute:NSLayoutAttributeWidth
                                                                      relatedBy:0
                                                                         toItem:cell.contentView
                                                                      attribute:NSLayoutAttributeHeight
                                                                     multiplier:1
                                                                       constant:0]];
        
        // label has height pinned to superview.
        [cell.contentView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[label]|"
                                                                                  options:0
                                                                                  metrics:nil
                                                                                    views:bindings]];
        
        // Horizontal margins.
        [cell.contentView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[label]-15-[imageView]-15-|"
                                                                                  options:0
                                                                                  metrics:nil
                                                                                    views:bindings]];
    }
    
    UILabel *label = (UILabel *)[cell viewWithTag:2];
    label.text = [NSString stringWithFormat:@"Hello there! %ld", (long)indexPath.row];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    imageView.image = [self image];
    
    imageView.contentMode = UIViewContentModeCenter;

    imageView.clipsToBounds = YES;

    
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













































