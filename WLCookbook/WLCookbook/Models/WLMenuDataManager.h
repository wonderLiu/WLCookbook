//
//  WLMenuDataManager.h
//  WLCookbook
//
//  Created by wonderLiu on 16/1/26.
//  Copyright © 2016年 wonderLiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLMenuDataManager : NSObject

//+(NSArray*)menuCategoryFromJSON:(id)responseObject isSubMenuCategory:(BOOL)isSubMenuCategory;


+(NSArray*)menuCategoryFromJSON:(id)responseObject;

+(NSArray*)getMenuCategoryFromFile;

@end
