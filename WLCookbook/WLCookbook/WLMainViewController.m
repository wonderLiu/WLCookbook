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

@interface WLMainViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *apiTableView;
@end

@implementation WLMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *apiTV = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [apiTV setDelegate:self];
    [apiTV setDataSource:self];
    [self.view addSubview:apiTV];
    _apiTableView = apiTV;
    [self getCookCategoryList];
}

#pragma mark - Private
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
                       NSLog(@"%@", logContent);
                   } else {
                       logContent = [NSString stringWithFormat:@"request success!\n%@", [MOBFJson jsonStringFromObject:response.responder]];
                       NSLog(@"%@", logContent);
                   }
                   //[theController showLog:logContent];
               }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.contentView.backgroundColor = [UIColor orangeColor];
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
