//
//  ContactsData.h
//  TestApp
//
//  Created by Nosta on 19/11/2018.
//  Copyright © 2018 Nosta. All rights reserved.
//

#ifndef ContactsData_h
#define ContactsData_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ContactsData : NSObject  {}

@property NSMutableArray* arrayOfContacts;

- (void)loadContactsFromJSON;

@end

#endif /* ContactsData_h */
