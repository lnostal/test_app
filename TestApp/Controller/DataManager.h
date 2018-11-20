//
//  DataManager.h
//  TestApp
//
//  Created by Nosta on 19/11/2018.
//  Copyright © 2018 Nosta. All rights reserved.

#ifndef DataManager_h
#define DataManager_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DataForCell : NSObject {}

@property NSString *name;
@property NSString *message;
@property NSData *image;
@property NSString *dateAndTime;
@property NSInteger id;

-(DataForCell*)initWith:(NSString *)name message:(NSString*)message image:(NSData*)image dateAndTime:(NSString*)dateAndTime id:(NSInteger)id;

@end

@interface DataManager : NSObject {}

@property NSMutableArray *fields;
@property NSMutableArray *searchResult;

+ (DataManager *) shared;

- (void)createDataForTable;
- (NSArray*)searchWith:(NSString*) pattern;
- (DataForCell*)findContactById:(NSInteger)id;

@end

#endif /* DataManager_h */
