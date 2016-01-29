//
//  WLMenuDetail.m
//  WLCookbook
//
//  Created by wonderLiu on 16/1/29.
//  Copyright © 2016年 wonderLiu. All rights reserved.
//

#import "WLMenuDetail.h"

@implementation WLMenuDetail

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"curPage"     :  @"curPage",
             @"total"       :  @"total",
             @"menuList"    :  @"list"};
}

+(NSValueTransformer *)menuListJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        NSArray *jsonArray = value;
        NSMutableArray *listArray = [NSMutableArray array];
        [jsonArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL *stop) {
            WLMenuList *menuListItem = [MTLJSONAdapter modelOfClass:[WLMenuList class] fromJSONDictionary:obj error:nil];
            [listArray addObject:menuListItem];
        }];
        return listArray;
    }];
}

@end

@implementation WLMenuDescription

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"ingredients"     :  @"ingredients",
             @"method"          :  @"method",
             @"sumary"          :  @"sumary",
             @"title"           :  @"title"};
}

@end

@implementation WLMenuList

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"ctgIds"      : @"ctgIds",
             @"ctgTitles"   : @"ctgTitles",
             @"menuId"      : @"menuId",
             @"name"        : @"name",
             @"recipe"      : @"recipe",
             @"thumbnail"   : @"thumbnail"};
}

@end
