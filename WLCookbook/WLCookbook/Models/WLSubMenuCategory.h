//
//  WLSubMenuCategory.h
//  WLCookbook
//
//  Created by wonderLiu on 16/1/27.
//  Copyright © 2016年 wonderLiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLSubMenuCategory : NSObject
/** 菜谱子分类ID*/
@property (nonatomic,strong)NSString *ctgId;
/** 菜谱子分类类型名称*/
@property (nonatomic,strong)NSString *name;

+(id)subMenuCategoryFromDict:(NSDictionary*)subMenuCategoryDict;

@end
