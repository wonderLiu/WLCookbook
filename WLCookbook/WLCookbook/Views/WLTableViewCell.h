//
//  WLTableViewCell.h
//  WLFindDeals
//
//  Created by tarena45 on 15/12/19.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLTableViewCell : UITableViewCell

+(id)cellWithTableView:(UITableView*)tableView withImageName:(NSString *)imageName withHighlightedImageName:(NSString*)highlightedImageName;

@end
