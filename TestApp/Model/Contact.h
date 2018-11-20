//
//  Contact.h
//  TestApp
//
//  Created by Nosta on 19/11/2018.
//  Copyright © 2018 Nosta. All rights reserved.
//

#ifndef Contact_h
#define Contact_h

@interface Contact : NSObject {}

@property NSString    *firstName;
@property NSString    *lastName;
@property NSString    *message;
@property NSData      *image;
@property NSString    *date;
@property NSString    *time;
@property NSString    *id;

-(id)initWithFormat:(NSString *)firstName lastName:(NSString*)lastName message:(NSString*)message pathForImage:(NSString*)pathForImage date:(NSString*)date time:(NSString*)time id:(NSString*)id;

@end

#endif /* Contact_h */
