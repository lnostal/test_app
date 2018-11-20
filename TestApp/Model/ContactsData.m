//
//  ContactsData.m
//  TestApp
//
//  Created by Nosta on 19/11/2018.
//  Copyright © 2018 Nosta. All rights reserved.
//

#import "ContactsData.h"
#import "Contact.h"

@implementation ContactsData {}

-(id)init {
    self.arrayOfContacts = [[NSMutableArray alloc] init];
    [self loadContactsFromJSON];
    return self;
}

- (void)loadContactsFromJSON
{
    NSDictionary *dict = [self JSONFromFile];
    
    NSArray *data = [dict objectForKey:@"data"];
    
    for (NSDictionary *element in data) {

        NSString *firstName = [element objectForKey:@"name"];
        NSString *lastName = [element objectForKey:@"lastname"];
        NSString *message = [element objectForKey:@"message"];
        NSString *path = [element objectForKey:@"image"];
        NSString *date = [element objectForKey:@"date"];
        NSString *time = [element objectForKey:@"time"];
        NSString *id = [element objectForKey:@"id"];
        
        Contact* newContact = [[Contact alloc] initWithFormat:firstName lastName:lastName message:message pathForImage:path date:date time:time id:id];
        
        [self.arrayOfContacts addObject:newContact];
    }
}

- (NSDictionary *)JSONFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

@end

