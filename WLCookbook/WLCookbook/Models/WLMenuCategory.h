//
//  WLMenuCategory.h
//  WLCookbook
//
//  Created by wonderLiu on 16/1/26.
//  Copyright © 2016年 wonderLiu. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 菜谱分类*/
@interface WLMenuCategory : NSObject <NSCoding>
/** 菜谱分类ID*/
@property (nonatomic,strong)NSString *ctgId;
/** 菜谱分类类型*/
@property (nonatomic,strong)NSString *name;
/** 菜谱分类类型子分类*/
@property (nonatomic,strong)NSArray *subCategory;


+(id)menuCategoryFromDict:(NSDictionary*)menuCategoryDict;

//+(id)subMenuCategoryFromDict:(NSDictionary*)subMenuCategoryDict;

@end
