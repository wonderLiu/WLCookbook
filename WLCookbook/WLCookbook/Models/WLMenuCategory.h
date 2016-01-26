//
//  WLMenuCategory.h
//  WLCookbook
//
//  Created by wonderLiu on 16/1/26.
//  Copyright © 2016年 wonderLiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLMenuCategory : NSObject
/** 菜谱分类ID*/
@property (nonatomic,strong)NSString *ctgId;
/** 菜谱分类类型*/
@property (nonatomic,strong)NSString *name;

+(id)menuCategoryFromDict:(NSDictionary*)menuCategoryDict;

@end
