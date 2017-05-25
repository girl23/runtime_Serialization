//
//  Person.m
//  SerializationAndDeserialization
//
//  Created by wdwk on 2017/5/25.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
@implementation Person
-(void)encodeWithCoder:(NSCoder *)aCoder{
    //告诉系统要归档那些属性；
//    [aCoder encodeObject:_name forKey:@"name"];
//    [aCoder encodeInt:_age forKey:@"age"];
    unsigned int count=0;
    //获取Person所有变量；
    Ivar * ivars=class_copyIvarList([Person class], &count);
    for (int i=0; i<count; i++) {
        //拿到每个IVar;
        Ivar ivar=ivars[i];
        //IVar获取属性的名称(是一个C语言字符串)；
        const char * name=ivar_getName(ivar);
        //将c语言转换OC;
       NSString * key= [NSString stringWithUTF8String:name];
        //获取属性的值--KVC
        id value=[self valueForKey:key];
        //归档；
        [aCoder encodeObject:value forKey:key];
        
    }
   
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    //取
    self=[super init];
    if (self) {
//        _name=[aDecoder decodeObjectForKey:@"name"];
//        _age=[aDecoder decodeIntForKey:@"age"];
        unsigned int count=0;
        //获取Person所有变量；
        Ivar * ivars=class_copyIvarList([Person class], &count);
        for (int i=0; i<count; i++) {
            //拿到每个IVar;
            Ivar ivar=ivars[i];
            //IVar获取属性的名称(是一个C语言字符串)；
            const char * name=ivar_getName(ivar);
            //将c语言转换OC;
            NSString * key= [NSString stringWithUTF8String:name];
         
          
            //解档；
            id value=[aDecoder decodeObjectForKey:key];
            //设置到属性上
            [self setValue:value forKey:key];
  
        }
    }
    return self ;
}

@end
