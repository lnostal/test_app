//
//  DataManager.m
//  TestApp
//
//  Created by Nosta on 19/11/2018.
//  Copyright © 2018 Nosta. All rights reserved.
//

#import "ContactsData.h"
#import "Contact.h"
#import "DataManager.h"

@implementation DataForCell

-(DataForCell*)initWith:(NSString *)name message:(NSString*)message image:(NSData*)image dateAndTime:(NSString*)dateAndTime id:(NSInteger)id{
    self.name = name;
    self.message = message;
    self.image = image;
    self.dateAndTime = dateAndTime;
    self.id = id;
    
    return self;
}

@end

@implementation DataManager

static DataManager *instanse = nil;

+ (DataManager *) shared {
    if (instanse == nil) {
        instanse = [[DataManager alloc] init];
    }
    return instanse;
}

- (id)init {
    self.fields = [[NSMutableArray alloc] init];
    [self createDataForTable];
    instanse = self;
    return instanse;
}

- (NSMutableArray*)searchWith:(NSString*) pattern {

    self.searchResult = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < self.fields.count; i++) {
        DataForCell* data = [self.fields objectAtIndex:i];
        NSString* name = data.name;
        
        if ([name containsString:pattern]) {
            [self.searchResult addObject:data];
        }
    }
    
    return [self searchResult];
}

- (DataForCell*)findContactById:(NSInteger)id {
    for (int i = 0; i < self.fields.count; i++) {
        DataForCell* data = [self.fields objectAtIndex:i];
        if (data.id == id) {
            return data;
        }
    }
    
    return nil;
}

- (void)createDataForTable{
    ContactsData *allData = [[ContactsData alloc] init];
    
    NSUInteger numberOfContacts = [[allData arrayOfContacts] count];
    
    for (int i = 0; i < numberOfContacts; i++) {
        Contact *contact = [[allData arrayOfContacts] objectAtIndex:i];
        
        NSString *firstName = contact.firstName;
        NSString *lastName = contact.lastName;
        
        NSString *nameForTable;
        
        if (firstName == nil && lastName == nil) {
            nameForTable = @"Unknown";
        } else {
            nameForTable = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
        }
        
        NSString *date = contact.date;
        NSString *time = contact.time;
        
        NSString *dateAndTimeForTable;
        
        if (date == nil && time == nil) {
            dateAndTimeForTable = @"00:00 01/01";
        } else {
            dateAndTimeForTable = [NSString stringWithFormat:@"%@ %@", time, date];
        }
        
        DataForCell *data = [[DataForCell alloc] initWith:nameForTable message:contact.message image:contact.image dateAndTime:dateAndTimeForTable id:[contact.id integerValue]];
        
        [self.fields addObject:data];
        
    }
}

@end
