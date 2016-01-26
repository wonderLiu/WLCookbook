//
//  WLMenuCategory.m
//  WLCookbook
//
//  Created by wonderLiu on 16/1/26.
//  Copyright © 2016年 wonderLiu. All rights reserved.
//

#import "WLMenuCategory.h"

@implementation WLMenuCategory

+(id)menuCategoryFromDict:(NSDictionary *)menuCategoryDict
{
    return [[self alloc]initWithMenuCategoryDict:menuCategoryDict];
}

-(id)initWithMenuCategoryDict:(NSDictionary*)menuCategoryDict
{
    if (self = [super init]) {
        self.name = menuCategoryDict[@"categoryInfo"][@"name"];
        self.ctgId = menuCategoryDict[@"categoryInfo"][@"ctgId"];
    }
    return self;
}


-(NSString *)description
{
    //WLMenuCategory *menu = [WLMenuCategory new];
    return [NSString stringWithFormat:@"id--> %@,name -->%@",self.ctgId,self.name];
}


@end
