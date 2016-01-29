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

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.ctgId = [aDecoder decodeObjectForKey:@"ctgId"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
//    [aCoder encodeConditionalObject:self.name];
//    [aCoder encodeConditionalObject:self.ctgId];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.ctgId forKey:@"ctgId"];
}

@end
