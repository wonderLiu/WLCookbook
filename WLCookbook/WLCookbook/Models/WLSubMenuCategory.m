//
//  WLSubMenuCategory.m
//  WLCookbook
//
//  Created by wonderLiu on 16/1/27.
//  Copyright © 2016年 wonderLiu. All rights reserved.
//

#import "WLSubMenuCategory.h"

@implementation WLSubMenuCategory

+(id)subMenuCategoryFromDict:(NSDictionary *)subMenuCategoryDict
{
    return [[self alloc]initWithSubMenuCategoryFromDict:subMenuCategoryDict];
}

-(id)initWithSubMenuCategoryFromDict:(NSDictionary*)subMenuCategoryDict
{
    if (self = [super init]) {
        self.name = subMenuCategoryDict[@"categoryInfo"][@"name"];
        self.ctgId = subMenuCategoryDict[@"categoryInfo"][@"ctgId"];
    }
    return self;
}

@end
