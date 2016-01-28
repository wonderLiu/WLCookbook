//
//  WLSubMenuCategory.h
//  WLCookbook
//
//  Created by wonderLiu on 16/1/27.
//  Copyright © 2016年 wonderLiu. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 菜谱分类子分类*/
@interface WLSubMenuCategory : NSObject <NSCoding>
/** 菜谱子分类ID*/
@property (nonatomic,strong)NSString *ctgId;
/** 菜谱子分类类型名称*/
@property (nonatomic,strong)NSString *name;

+(id)subMenuCategoryFromDict:(NSDictionary*)subMenuCategoryDict;

@end
