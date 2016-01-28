//
//  WLMenuCategoryViewController.m
//  WLCookbook
//
//  Created by wonderLiu on 16/1/26.
//  Copyright © 2016年 wonderLiu. All rights reserved.
//

#import "WLMenuCategoryViewController.h"
#import "WLMenuDataManager.h"
#import "WLSubMenuCategory.h"
#import "WLMenuCategory.h"
#import "WLTableViewCell.h"

@interface WLMenuCategoryViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 菜单类型数组*/
@property (nonatomic,strong)NSArray *menuCategoryArray;
/** 菜谱子分类类型名称数组*/
@property (nonatomic,strong)NSArray *subMenuCategoryArray;

@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;

@end

@implementation WLMenuCategoryViewController

-(NSArray *)menuCategoryArray
{
    if (!_menuCategoryArray) {
        _menuCategoryArray = [WLMenuDataManager getMenuCategoryFromFile];
    }
    return _menuCategoryArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredContentSize = CGSizeMake(280, 264);
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.leftTableView) {
        return self.menuCategoryArray.count;
    }else{
        NSInteger selectedRow = [self.leftTableView indexPathForSelectedRow].row;
        WLMenuCategory *menuCategory = self.menuCategoryArray[selectedRow];
        return menuCategory.subCategory.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.leftTableView) {
        WLTableViewCell *cell = [WLTableViewCell cellWithTableView:tableView withImageName:@"bg_dropdown_leftpart" withHighlightedImageName:@"bg_dropdown_left_selected"];
        
        WLMenuCategory *menuCategory = self.menuCategoryArray[indexPath.row];
        cell.textLabel.text = menuCategory.name;
        if (menuCategory.subCategory.count > 0) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        return cell;
    }else{
        WLTableViewCell *cell = [WLTableViewCell cellWithTableView:tableView withImageName:@"bg_dropdown_leftpart" withHighlightedImageName:@"bg_dropdown_left_selected"];
        NSInteger selectedRow = [self.leftTableView indexPathForSelectedRow].row;
        WLMenuCategory *menuCategory = self.menuCategoryArray[selectedRow];
        NSArray *subMenuCategoryArray = menuCategory.subCategory;
        WLSubMenuCategory *subMenuCategory = subMenuCategoryArray[indexPath.row];
        cell.textLabel.text = subMenuCategory.name;
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.leftTableView) {
        [self.rightTableView reloadData];
        WLMenuCategory *menuCategory = self.menuCategoryArray[indexPath.row];
        if (menuCategory.subCategory.count == 0) {
            [[NSNotificationCenter defaultCenter]postNotificationName:@"WLMenuCategoryDidChanged" object:self userInfo:@{@"WLMenuCategory":menuCategory}];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }else{
        NSInteger leftRow = [self.leftTableView indexPathForSelectedRow].row;
        NSInteger rightRow = [self.rightTableView indexPathForSelectedRow].row;
        WLMenuCategory *menuCategory = self.menuCategoryArray[leftRow];
        NSArray *subMenuArray = menuCategory.subCategory;
        WLSubMenuCategory *subMenuCtg = subMenuArray[rightRow];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"WLMenuSubCategoryDidChanged" object:self userInfo:@{@"WLSubMenuCategory":subMenuCtg}];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
