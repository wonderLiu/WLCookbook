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
        self.subCategory = menuCategoryDict[@"childs"];
    }
    return self;
}

//重写description方法
-(NSString *)description
{
    return [NSString stringWithFormat:@"id--> %@,name -->%@",self.ctgId,self.name];
}

#pragma mark - NSCoding
//编码操作
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.ctgId forKey:@"ctgId"];
    [aCoder encodeObject:self.subCategory forKey:@"subCategory"];
}

//解码操作
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.ctgId = [aDecoder decodeObjectForKey:@"ctgId"];
        self.subCategory = [aDecoder decodeObjectForKey:@"subCategory"];
    }
    return self;
}


@end
