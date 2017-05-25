//
//  ViewController.m
//  SerializationAndDeserialization
//
//  Created by wdwk on 2017/5/25.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)save:(id)sender {
    Person *p=[Person new];
    p.name=@"zlzl";
    p.age=26;
    NSString * temp=NSTemporaryDirectory();
    NSString * filePath=[temp stringByAppendingPathComponent:@"zl.zl"];
    NSLog(@"%@",temp);
    [NSKeyedArchiver archiveRootObject:p toFile:filePath];
}
- (IBAction)read:(id)sender {
    NSString * temp=NSTemporaryDirectory();
    NSString * filePath=[temp stringByAppendingPathComponent:@"zl.zl"];
   Person * p1= [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@_%d",p1.name,p1.age);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
