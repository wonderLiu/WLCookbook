//
//  WLMenuDataManager.m
//  WLCookbook
//
//  Created by wonderLiu on 16/1/26.
//  Copyright © 2016年 wonderLiu. All rights reserved.
//

#import "WLMenuDataManager.h"
#import "WLMenuCategory.h"
#import "WLSubMenuCategory.h"

@implementation WLMenuDataManager

+(NSArray *)menuCategoryFromJSON:(id)responseObject
{
    NSArray *menuCtgArray = responseObject[@"childs"];
//    NSArray *subMenuCtgArray = menuCtgArray[0][@"childs"];
    NSMutableArray *menuCategoryArray = [NSMutableArray array];
//    NSMutableArray *subMenuCategoryArray = [NSMutableArray array];
    NSDictionary *allMenu = responseObject[@"categoryInfo"];
    WLMenuCategory *menuctg = [WLMenuCategory new];
    menuctg.name = allMenu[@"name"];
    menuctg.ctgId = allMenu[@"ctgId"];
    [menuCategoryArray insertObject:menuctg atIndex:0];
    
    for (NSDictionary *dict in menuCtgArray) {
        WLMenuCategory *menuCtg = [WLMenuCategory menuCategoryFromDict:dict];
        [menuCategoryArray addObject:menuCtg];
    }
    NSArray *array = menuCategoryArray;
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *writePath = [docPath stringByAppendingPathComponent:@"menuCtg"];
    //归档操作
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:array forKey:@"menuCategoryArray"];
    [archiver finishEncoding];
    BOOL flag = [data writeToFile:writePath atomically:YES];
    if (flag) {
        NSLog(@"写入成功");
    }else{
        NSLog(@"写入失败");
    }
    /**
     //    if (isSubMenuCategory) {
     //        for (NSDictionary *dict in subMenuCtgArray) {
     //            WLSubMenuCategory *subMenuCategory = [WLSubMenuCategory subMenuCategoryFromDict:dict];
     //            [subMenuCategoryArray addObject:subMenuCategory];
     //        }
     //    }else{
     //        for (NSDictionary *dict in menuCtgArray) {
     //            WLMenuCategory *menuCtg = [WLMenuCategory menuCategoryFromDict:dict];
     //            [menuCategoryArray addObject:menuCtg];
     //        }
     //        NSArray *array = menuCategoryArray;
     //        NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
     //        NSString *writePath = [docPath stringByAppendingPathComponent:@"menuCtg"];
     //        //归档操作
     //        NSMutableData *data = [NSMutableData data];
     //        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
     //        [archiver encodeObject:array forKey:@"menuCategoryArray"];
     //        [archiver finishEncoding];
     //        BOOL flag = [data writeToFile:writePath atomically:YES];
     //        if (flag) {
     //            NSLog(@"写入成功");
     //        }else{
     //            NSLog(@"写入失败");
     //        }
     //    }
     //    return isSubMenuCategory? [subMenuCategoryArray copy] : [menuCategoryArray copy];
     
     */
    return [menuCategoryArray copy];
}

@end
