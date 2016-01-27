//
//  WLTableViewCell.m
//  WLFindDeals
//
//  Created by tarena45 on 15/12/19.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "WLTableViewCell.h"

@implementation WLTableViewCell

////重写setter方法
//-(void)setCategory:(WLCategories *)category
//{
//    self.imageView.image = [UIImage imageNamed:category.small_icon];
//    self.imageView.highlightedImage = [UIImage imageNamed:category.small_highlighted_icon];
//    self.textLabel.text = category.name;
//    if (category.subcategories.count > 0) {
//        self.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_cell_rightArrow"]];
//    }else{
//        self.accessoryView = nil;
//    }
//}

+(id)cellWithTableView:(UITableView *)tableView withImageName:(NSString *)imageName withHighlightedImageName:(NSString *)highlightedImageName
{
    static NSString *identifier = @"Cell";
    WLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[WLTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    cell.selectedBackgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:highlightedImageName]];
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
