//
//  WLMenuDataManager.m
//  WLCookbook
//
//  Created by wonderLiu on 16/1/26.
//  Copyright © 2016年 wonderLiu. All rights reserved.
//

#import "WLMenuDataManager.h"
#import "WLMenuCategory.h"

@implementation WLMenuDataManager

+(NSArray *)menuCategoryFromJSON:(id)responseObject
{
    NSArray *menuCtgArray = responseObject[@"childs"];
    NSMutableArray *menuCategoryArray = [NSMutableArray array];
    NSDictionary *allMenu = responseObject[@"categoryInfo"];
    WLMenuCategory *menuctg = [WLMenuCategory new];
    menuctg.name = allMenu[@"name"];
    menuctg.ctgId = allMenu[@"ctgId"];
    [menuCategoryArray insertObject:menuctg atIndex:0];
    for (NSDictionary *dict in menuCtgArray) {
        WLMenuCategory *menuCtg = [WLMenuCategory menuCategoryFromDict:dict];
        [menuCategoryArray addObject:menuCtg];
    }
    return [menuCategoryArray copy];
}

@end
