//
//  XibCell.h
//  Table_Views_and_Collection_Views
//
//  Created by Daniel Wallace [DATACOM] on 11/08/14.
//  Copyright (c) 2014 nz.co.danielw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XibCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *theLabel;
@property (nonatomic, weak) IBOutlet UIImageView *theImageView;

@end
