//
//  CustomCell.h
//  TestApp
//
//  Created by Nosta on 19/11/2018.
//  Copyright © 2018 Nosta. All rights reserved.
//

#ifndef CustomCell_h
#define CustomCell_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CustomCell : UITableViewCell {
    
    
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

#endif /* CustomCell_h */
