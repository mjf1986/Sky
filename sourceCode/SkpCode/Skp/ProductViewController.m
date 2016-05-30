//
//  ProductViewController.m
//  Skp
//
//  Created by 剑锋 莫 on 16/3/11.
//  Copyright © 2016年 剑锋 莫. All rights reserved.
//

#import "ProductViewController.h"
#import "PKRevealController.h"
#import "INSSearchBar.h"

@interface ProductViewController ()<INSSearchBarDelegate>
@property (nonatomic, strong) INSSearchBar *searchBarWithDelegate;
@end

@implementation ProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Product"];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    UIBarButtonItem *btnLeft = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftmenu"] style:UIBarButtonItemStylePlain target:self action:@selector(showLeftView)];
    self.navigationItem.leftBarButtonItem = btnLeft;
    
    self.searchBarWithDelegate = [[INSSearchBar alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.bounds) - 20.0 - 44, 0.0, 44.0, 34.0)];
    self.searchBarWithDelegate.delegate = self;
    
    //[self.view addSubview:self.searchBarWithDelegate];
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]initWithCustomView:self.searchBarWithDelegate];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObject:searchButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//按钮点击事件
- (void) showLeftView {
    PKRevealController *revealController = self.parentViewController.parentViewController.revealController;
    [revealController showViewController:revealController.leftViewController];
    
}

#pragma mark - search bar delegate

- (CGRect)destinationFrameForSearchBar:(INSSearchBar *)searchBar
{
    return CGRectMake(15.0, 0.0, CGRectGetWidth(self.view.bounds) - 30.0, 34.0);
}

- (void)searchBar:(INSSearchBar *)searchBar willStartTransitioningToState:(INSSearchBarState)destinationState
{
    // Do whatever you deem necessary.
    if(destinationState == INSSearchBarStateNormal)
    {
        [self setTitle:@"Product"];
    }
    else{
        [self setTitle:@" "];
    }
}

- (void)searchBar:(INSSearchBar *)searchBar didEndTransitioningFromState:(INSSearchBarState)previousState
{
    // Do whatever you deem necessary.
    
}

- (void)searchBarDidTapReturn:(INSSearchBar *)searchBar
{
    // Do whatever you deem necessary.
    // Access the text from the search bar like searchBar.searchField.text
}

- (void)searchBarTextDidChange:(INSSearchBar *)searchBar
{
    // Do whatever you deem necessary.
    // Access the text from the search bar like searchBar.searchField.text
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
