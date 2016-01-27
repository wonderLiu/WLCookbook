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

@interface WLMenuCategoryViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 菜单类型数组*/
@property (nonatomic,strong)NSArray *menuCategoryArray;
/** 菜单文件路径*/
@property (nonatomic,strong)NSString *menuPath;

@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;

@end

@implementation WLMenuCategoryViewController

-(NSString *)menuPath
{
    if (!_menuPath) {
        NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        _menuPath = [docPath stringByAppendingPathComponent:@"menuCtg"];
    }
    return _menuPath;
}

-(NSArray *)menuCategoryArray
{
    if (!_menuCategoryArray) {
        NSData *data = [NSData dataWithContentsOfFile:self.menuPath];
        NSKeyedUnarchiver *unArchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        _menuCategoryArray = [unArchiver decodeObjectForKey:@"menuCategoryArray"];
        [unArchiver finishDecoding];
    }
    return _menuCategoryArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredContentSize = CGSizeMake(280, 320);
    self.view.backgroundColor = [UIColor brownColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.leftTableView) {
        return self.menuCategoryArray.count;
    }else{
        NSInteger selectedRow = [self.leftTableView indexPathForSelectedRow].row;
        NSArray *subMenuCategoryArray = self.menuCategoryArray[selectedRow];
        return subMenuCategoryArray.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.leftTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        WLMenuCategory *menuCategory = self.menuCategoryArray[indexPath.row];
        cell.textLabel.text = menuCategory.name;
        cell.contentView.backgroundColor = [UIColor blackColor];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        NSInteger selectedRow = [self.leftTableView indexPathForSelectedRow].row;
        NSArray *subMenuCategoryArray = self.menuCategoryArray[selectedRow];
        cell.textLabel.text = subMenuCategoryArray[indexPath.row];
        return cell;
    }
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
