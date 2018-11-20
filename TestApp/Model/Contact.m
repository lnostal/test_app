//
//  Contact.m
//  TestApp
//
//  Created by Nosta on 19/11/2018.
//  Copyright © 2018 Nosta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@implementation Contact {}

-(id)initWithFormat:(NSString *)firstName lastName:(NSString*)lastName message:(NSString*)message pathForImage:(NSString*)pathForImage date:(NSString*)date time:(NSString*)time id:(NSString*)id{
    
    self.firstName = firstName;
    self.lastName = lastName;
    self.message = message;
    self.image = [NSData dataWithContentsOfURL:[NSURL URLWithString:pathForImage]];
    self.date = date;
    self.time = time;
    self.id = id;
    
    return self;
}

@end
