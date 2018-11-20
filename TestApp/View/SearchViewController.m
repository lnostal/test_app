//
//  FirstViewController.m
//  TestApp
//
//  Created by Nosta on 17/11/2018.
//  Copyright © 2018 Nosta. All rights reserved.
//

#import "SearchViewController.h"
#import "CustomCell.h"
#import "DataManager.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self filterContentForSearchText:searchText];
    [[self tableView] reloadData];
}

- (void)reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation {
}

// количество ячеек
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[[DataManager shared] searchResult] count];
}

// инициализация ячеек
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"customCell";
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    DataForCell* data = [[[DataManager shared] searchResult] objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = data.name;
    cell.messageLabel.text = data.message;
    cell.imageView.image = [UIImage imageWithData:data.image];
    cell.imageView.layer.cornerRadius = cell.imageView.frame.size.height / 2;
    cell.imageView.clipsToBounds = YES;
    cell.dateLabel.text = data.dateAndTime;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
}

- (void)filterContentForSearchText:(NSString*)searchText {
    
    [[DataManager shared] searchWith:searchText];
}

@end

