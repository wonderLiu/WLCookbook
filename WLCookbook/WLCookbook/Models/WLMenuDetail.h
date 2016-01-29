//
//  WLMenuDetail.h
//  WLCookbook
//
//  Created by wonderLiu on 16/1/29.
//  Copyright © 2016年 wonderLiu. All rights reserved.
//

#import <Mantle/Mantle.h>

/** 单个菜谱结果详情*/
@interface WLMenuDescription : MTLModel<MTLJSONSerializing>

@property (nonatomic,strong) NSString *ingredients;
@property (nonatomic,strong) NSString *method;
@property (nonatomic,strong) NSString *sumary;
@property (nonatomic,strong) NSString *title;

@end

/** 返回菜谱结果列表*/
@interface WLMenuList : MTLModel<MTLJSONSerializing>

@property (nonatomic,strong) NSArray *ctgIds;
@property (nonatomic,strong) NSString *ctgTitles;
@property (nonatomic,strong) NSString *menuId;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) WLMenuDescription *recipe;
@property (nonatomic,strong) NSString *thumbnail;

@end

@interface WLMenuDetail : MTLModel<MTLJSONSerializing>

@property (nonatomic,assign) NSInteger curPage;
@property (nonatomic,assign) NSInteger total;
@property (nonatomic,strong) NSArray *menuList;

@end

