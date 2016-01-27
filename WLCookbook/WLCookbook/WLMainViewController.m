//
//  WLMainViewController.m
//  WLCookbook
//
//  Created by wonderLiu on 16/1/26.
//  Copyright © 2016年 wonderLiu. All rights reserved.
//

#import "WLMainViewController.h"
#import <mobAPI/mobAPI.h>
#import <MOBFoundation/MOBFJson.h>
#import "WLMenuDataManager.h"
#import "WLMenuCategory.h"
#import "WLMenuCategoryViewController.h"

@interface WLMainViewController ()<UITableViewDataSource,UITableViewDelegate,UIPopoverPresentationControllerDelegate>

@property (nonatomic, strong) UITableView *menuTableView;
@property (nonatomic,strong) NSArray *menuCategoryArray;
/** 弹出的popView*/
@property (nonatomic,strong) WLMenuCategoryViewController *ctgViewController;
@end

@implementation WLMainViewController

-(NSArray*)menuCategoryArray {
    if (!_menuCategoryArray) {
        _menuCategoryArray = [NSArray array];
    }
    return _menuCategoryArray;
}

-(UITableView *)menuTableView
{
    if (!_menuTableView) {
        _menuTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _menuTableView.delegate = self;
        _menuTableView.dataSource = self;
        [self.view addSubview:_menuTableView];
    }
    return _menuTableView;
}

-(WLMenuCategoryViewController *)ctgViewController
{
    if (!_ctgViewController) {
        _ctgViewController = [[WLMenuCategoryViewController alloc]init];
    }
    return _ctgViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getCookCategoryList];
    [self setNavigationCenterButton];
}

/** 导航栏添加中间按钮*/
-(void)setNavigationCenterButton
{
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(0, 0, 200, 44);
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"美食汇" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickToChangeCategory) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = btn;
}

-(void)clickToChangeCategory{
    self.ctgViewController.modalPresentationStyle = UIModalPresentationPopover;
    self.ctgViewController.popoverPresentationController.sourceView = self.navigationItem.titleView;
    self.ctgViewController.popoverPresentationController.sourceRect = self.navigationItem.titleView.bounds;
    self.ctgViewController.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    self.ctgViewController.popoverPresentationController.delegate = self;
    [self presentViewController:self.ctgViewController animated:YES completion:nil];
}

-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}

#pragma mark - Private
/**
 //- (void)waitLoading:(BOOL)flag
 //{
 //    static UIView *loadingView = nil;
 //    if (!loadingView)
 //    {
 //        loadingView = [[UIView alloc] initWithFrame:self.view.bounds];
 //        loadingView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
 //        loadingView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
 //
 //        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
 //        [indicatorView sizeToFit];
 //        indicatorView.frame = CGRectMake((loadingView.frame.size.width - indicatorView.frame.size.width) / 2, (loadingView.frame.size.height - indicatorView.frame.size.height) / 2, indicatorView.frame.size.width, indicatorView.frame.size.height);
 //        indicatorView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;
 //        [indicatorView startAnimating];
 //        [loadingView addSubview:indicatorView];
 //
 //        [self.view addSubview:loadingView];
 //    }
 //
 //    loadingView.hidden = !flag;
 //}

 */

/**
 *  获取菜谱分类
 */
- (void)getCookCategoryList
{
    //[self waitLoading:YES];
    //__weak WLMainViewController *theController = self;
    [MobAPI sendRequest:[MOBACookRequest categoryRequest]
               onResult:^(MOBAResponse *response) {
                   NSString *logContent = nil;
                   if (response.error) {
                       logContent = [NSString stringWithFormat:@"request error!\n%@", response.error];
                       NSLog(@"%@",logContent);
                   } else {
                       logContent = [NSString stringWithFormat:@"request success!\n%@", [MOBFJson jsonStringFromObject:response.responder]];
                       NSLog(@"%@",response.responder);
                       self.menuCategoryArray = [WLMenuDataManager menuCategoryFromJSON:response.responder isSubMenuCategory:NO];
                       NSLog(@"%@",self.menuCategoryArray);
                       [self.menuTableView reloadData];
                   }
                   //[theController showLog:logContent];
               }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuCategoryArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.contentView.backgroundColor = [UIColor orangeColor];
    WLMenuCategory *menuCtg = self.menuCategoryArray[indexPath.row];
    cell.textLabel.text = menuCtg.name;
    cell.detailTextLabel.text = menuCtg.ctgId;
    return cell;
}



//- (void)showLog:(NSString *)log
//{
//    [self waitLoading:NO];
//    
//    LogViewController *vc = [[LogViewController alloc] init];
//    [vc setLog:log];
//    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
//    [self presentViewController:nvc animated:YES completion:nil];
//}

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
