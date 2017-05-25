//
//  AppDelegate.h
//  SerializationAndDeserialization
//
//  Created by wdwk on 2017/5/25.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

