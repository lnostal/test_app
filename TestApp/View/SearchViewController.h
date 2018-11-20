//
//  FirstViewController.h
//  TestApp
//
//  Created by Nosta on 17/11/2018.
//  Copyright © 2018 Nosta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

