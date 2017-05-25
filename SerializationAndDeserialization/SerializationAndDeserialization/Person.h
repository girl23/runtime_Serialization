//
//  Person.h
//  SerializationAndDeserialization
//
//  Created by wdwk on 2017/5/25.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
//要想能够归档解档需要遵循NSCoding协议；
@property(nonatomic, copy)NSString *name;
@property(nonatomic,assign)int age;
@end
