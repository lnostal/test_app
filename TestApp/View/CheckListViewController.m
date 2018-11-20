//
//  SecondViewController.m
//  TestApp
//
//  Created by Nosta on 17/11/2018.
//  Copyright © 2018 Nosta. All rights reserved.
//

#import "CheckListViewController.h"
#import "CustomCell.h"
#import "DataManager.h"

@interface CheckListViewController()

@end

@implementation CheckListViewController
{
    NSArray *data;
    NSMutableDictionary *selectedImages;
}

-(CGRect)updateHeight:(int)newHeight{
    CGRect newFrame = self.stackView.frame;
    newFrame.size.height = newHeight;
    
    return newFrame;
}
-(CGRect)updateWidth:(int)newWidth{
    CGRect newFrame = self.stackView.frame;
    newFrame.size.width = newWidth;
    
    return newFrame;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self tableView] setEditing:YES animated:YES];
    selectedImages = [[NSMutableDictionary alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[DataManager shared] fields] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"customCell";
    CustomCell *cell = (CustomCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    DataForCell* data = [[[DataManager shared] fields] objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = data.name;
    cell.messageLabel.text = data.message;
    cell.imageView.image = [UIImage imageWithData:data.image];
    cell.imageView.tag = data.id;
    cell.imageView.layer.cornerRadius = cell.imageView.frame.size.height / 2;
    cell.imageView.clipsToBounds = YES;
    cell.dateLabel.text = data.dateAndTime;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellAccessoryCheckmark;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    NSInteger tag = cell.imageView.tag;
    
    DataForCell* data = [[DataManager shared] findContactById:tag];
    UIImageView* view = [[UIImageView alloc] initWithImage:[[UIImage alloc] initWithData:data.image]];
    view.layer.cornerRadius = cell.imageView.frame.size.height / 2;
    view.clipsToBounds = YES;
    view.frame = [self updateWidth:66];
    view.frame = [self updateHeight:66];
    
    view.tag = tag;
    
    [self.stackView addArrangedSubview:view];
    [selectedImages setValue:view forKey:[[NSNumber numberWithInteger:tag] stringValue]];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    NSInteger tag = cell.imageView.tag;
    
    UIImageView* view = [selectedImages objectForKey:[[NSNumber numberWithInteger:tag] stringValue]];
    view.image = nil;
    [self.stackView removeArrangedSubview:view];
}

@end
