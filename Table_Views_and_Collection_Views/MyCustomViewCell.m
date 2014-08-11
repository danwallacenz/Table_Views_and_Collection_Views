//
//  MyCustomViewCell.m
//  Table_Views_and_Collection_Views
//
//  Created by Daniel Wallace [DATACOM] on 11/08/14.
//  Copyright (c) 2014 nz.co.danielw. All rights reserved.
//

#import "MyCustomViewCell.h"

@implementation MyCustomViewCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect contentViewBounds = self.contentView.bounds;
    CGRect imageViewFrame = self.imageView.frame;
    
    // Move the imageView to the right.
    imageViewFrame.origin.x = contentViewBounds.size.width - imageViewFrame.size.width - 15;
    self.imageView.frame = imageViewFrame;
    
    // Move the text label to the left.
    CGRect textLabelFrame = self.textLabel.frame;
    textLabelFrame.origin.x = 15;
    self.textLabel.frame = textLabelFrame;
    
    
    UIColor *borderColor = [UIColor colorWithRed:.8 green:.8 blue:.6 alpha:1.0];
    UIColor *backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:.4 alpha:1.0];
    
    self.contentView.layer.borderWidth = 0.5;
    self.contentView.layer.borderColor = [borderColor CGColor];
    self.contentView.backgroundColor = [backgroundColor colorWithAlphaComponent:0.4];
    
    self.imageView.layer.borderWidth = 0.5;
    self.imageView.layer.borderColor = [borderColor CGColor];
    self.imageView.backgroundColor = [backgroundColor colorWithAlphaComponent:0.5];
    
    self.textLabel.layer.borderWidth = 0.5;
    self.textLabel.layer.borderColor = [borderColor CGColor];
    self.textLabel.backgroundColor = [backgroundColor colorWithAlphaComponent:0.6];
    
//    self.backgroundColor  = [backgroundColor colorWithAlphaComponent:0.1]; // messes with the colors.
    
}

@end
