//
//  MainFaceController.m
//  PKRevealControllerDemo
//
//  Created by Barry Wey on 8/21/13.
//  Copyright (c) 2013 Barry Wey. All rights reserved.
//

#import "MainFaceController.h"
#import "PKRevealController.h"
#import "CommonHeader.h"
#import "INSSearchBar.h"
#import "SearchViewController.h"
#import "MenusCell.h"
#import "HMSegmentedControl.h"
#import "FirstTableViewController.h"
#import "TableViewController2.h"
#import "GroupCollection.h"
#import "GroupCollectionTree.h"

@interface MainFaceController ()<UIScrollViewDelegate>

//@property (weak, nonatomic) IBOutlet UILabel *lblWelcome;
@property (nonatomic, retain) UITabBar *tabBar;

@property (strong,nonatomic)UIScrollView *scrollView;
@property (strong,nonatomic)NSMutableArray *slideImages;
//@property (strong,nonatomic)UIPageControl *pageControl;
@property (strong,nonatomic)NSArray *slideTableViews;
@property (strong,nonatomic)HMSegmentedControl *segmentedControl;



@end
#define HEIGHT_IMAGE 100
@implementation MainFaceController

-(void)initForViews
{
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] init];
    _segmentedControl = segmentedControl;
    [segmentedControl setSectionTitles:@[@"All",@"Strip/Aluminum Bar", @"Comercial lighting", @"Industrial lighting",@"Smart Home"]];
    [segmentedControl addTarget:self action:@selector(segmentSelect:) forControlEvents:UIControlEventValueChanged];
    [segmentedControl setBackgroundColor:APPFRAME_COLOR];
    [segmentedControl setTextColor:HINT_COLOR];
    segmentedControl.font =  [UIFont fontWithName:@"Helvetica" size:9];
    [segmentedControl setSelectionIndicatorColor:BLACK_COLOR];
    [segmentedControl setSelectionIndicatorMode:HMSelectionIndicatorResizesToStringWidth/*HMSelectionIndicatorFillsSegment*/];
    [segmentedControl setTag:3];
    [self.view addSubview:segmentedControl];
     [segmentedControl setSelectedIndex:0];
    segmentedControl.sd_layout
    .topSpaceToView(self.view, 0)
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .heightIs(20);

    UIScrollView *scrollView = [UIScrollView new];
    scrollView.bounces = YES;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    
    FirstTableViewController *tableView1 = [[FirstTableViewController alloc]initWithStyle:UITableViewStylePlain];
    
    
    //创建CollectionView并指定布局对象
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    //指定布局方式为垂直
    flow.scrollDirection = UICollectionViewScrollDirectionVertical;
    flow.minimumLineSpacing = 10;//最小行间距(当垂直布局时是行间距，当水平布局时可以理解为列间距)
    flow.minimumInteritemSpacing = 10;//两个单元格之间的最小间距

    
    UICollectionViewFlowLayout *flow2 = [[UICollectionViewFlowLayout alloc]init];
    //指定布局方式为垂直
    flow2.scrollDirection = UICollectionViewScrollDirectionVertical;
    flow2.minimumLineSpacing = 10;//最小行间距(当垂直布局时是行间距，当水平布局时可以理解为列间距)
    flow2.minimumInteritemSpacing = 10;//两个单元格之间的最小间距

    
    //创建CollectionView并指定布局对象
    UICollectionViewFlowLayout *flow3 = [[UICollectionViewFlowLayout alloc]init];
    //指定布局方式为垂直
    flow3.scrollDirection = UICollectionViewScrollDirectionVertical;
    flow3.minimumLineSpacing = 10;//最小行间距(当垂直布局时是行间距，当水平布局时可以理解为列间距)
    flow3.minimumInteritemSpacing = 10;//两个单元格之间的最小间距


    //创建CollectionView并指定布局对象
    UICollectionViewFlowLayout *flow4 = [[UICollectionViewFlowLayout alloc]init];
    //指定布局方式为垂直
    flow4.scrollDirection = UICollectionViewScrollDirectionVertical;
    flow4.minimumLineSpacing = 10;//最小行间距(当垂直布局时是行间距，当水平布局时可以理解为列间距)
    flow4.minimumInteritemSpacing = 10;//两个单元格之间的最小间距
    
    GroupCollection *tableView2 = [[GroupCollection alloc]initWithCollectionViewLayout:flow];
    GroupCollection *tableView3 = [[GroupCollectionTree alloc]initWithCollectionViewLayout:flow2];
    GroupCollection *tableView4 = [[GroupCollectionTree alloc]initWithCollectionViewLayout:flow3];
    GroupCollection *tableView5 = [[GroupCollection alloc]initWithCollectionViewLayout:flow4];
    
    NSArray *one = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    NSArray *two = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"];
    NSArray *three = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"1",@"2"];
    NSArray *four = @[@"1",@"2",@"3"];
    tableView2.arrData = [[NSMutableArray alloc]initWithArray:one];
    tableView3.arrData = [[NSMutableArray alloc]initWithArray:two];
    tableView4.arrData = [[NSMutableArray alloc]initWithArray:three];
    tableView5.arrData = [[NSMutableArray alloc]initWithArray:four];
    
    [tableView2 setSd_tag:@(2)];
    [tableView3 setSd_tag:@(3)];
    [tableView4 setSd_tag:@(4)];
    [tableView5 setSd_tag:@(5)];

    [self addChildViewController:tableView1];
    [self addChildViewController:tableView2];
    [self addChildViewController:tableView3];
    [self addChildViewController:tableView4];
    [self addChildViewController:tableView5];


     _slideTableViews = @[tableView1.view,tableView2.view,tableView3.view,tableView4.view,tableView5.view];
    
    _scrollView = scrollView;
    _scrollView.sd_layout
    .topSpaceToView(segmentedControl, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0);
    
   
    
    _scrollView.backgroundColor = [UIColor whiteColor];
    
    CGFloat fWidth = [UIScreen mainScreen].bounds.size.width;//self.view.frame.size.width;
    CGFloat fHeight = self.view.frame.size.height;
    
    for (int i = 0;i<[_slideTableViews count] ;i++)
    {
        
        UIView *subView = _slideTableViews[i];
        [_scrollView addSubview:subView];
        subView.tag = 10001 + i;
        
        UIView *imageviewUp = [_scrollView viewWithTag:10001 + i -1];
        if(i==0)
        {
            subView.sd_layout
            .topSpaceToView(_scrollView, 0)
            .leftSpaceToView(_scrollView , 0)
            .widthRatioToView(self.view, 1)
            .heightRatioToView(_scrollView,1);
        }
        else {
            subView.sd_layout
            .topSpaceToView(_scrollView, 0)
            .leftSpaceToView(imageviewUp , 0)
            .widthRatioToView(self.view, 1)
            .heightRatioToView(_scrollView,1);
        }
        
    }
    [scrollView setContentSize:CGSizeMake(fWidth * ([_slideTableViews count]), HEIGHT_IMAGE)];
    [scrollView setContentOffset:CGPointMake(0, 0)];
    //[scrollView scrollRectToVisible:CGRectMake(0,0,fWidth,fHeight) animated:NO];
   
}


-(void)segmentSelect:(HMSegmentedControl *)segment
{
    
    NSInteger selectIndex = segment.selectedIndex;
    CGFloat fWidth = self.view.frame.size.width;
    [self.scrollView scrollRectToVisible:CGRectMake(fWidth*selectIndex,0,fWidth,HEIGHT_IMAGE) animated:YES]; //

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = APPFRAME_COLOR;
    //设置当前标题
    [self setTitle:@"Home"];
    //设置标题栏上左边的按钮
    UIBarButtonItem *btnLeft = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftmenu"] style:UIBarButtonItemStylePlain target:self action:@selector(showLeftView)];
    
//    UIBarButtonItem *btnLeft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(showLeftView)];
    self.navigationItem.leftBarButtonItem = btnLeft;
    //[self initForTaBar];

    UIBarButtonItem *btnRight = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStylePlain target:self action:@selector(clickSearch)];
    
    self.navigationItem.rightBarButtonItem = btnRight;
    self.edgesForExtendedLayout = NO;

    [self initForViews];
    
}

-(void)clickSearch
{
    SearchViewController *searchVC = [[SearchViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:searchVC];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}


-(void)initForTaBar
{
    //
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat tabBarHeight = 40;
    self.tabBar = [[UITabBar alloc] init];
    [self.tabBar setDelegate:self];
    //设置切换title
    UITabBarItem *tabBarItem1 = [[UITabBarItem alloc] initWithTitle:@"Home" image:[UIImage imageNamed:@"traffic"] tag:0];
    UITabBarItem *tabBarItem2 = [[UITabBarItem alloc] initWithTitle:@"Product" image:[UIImage imageNamed:@"traffic"] tag:1];
    UITabBarItem *tabBarItem3 = [[UITabBarItem alloc] initWithTitle:@"About Us" image:[UIImage imageNamed:@"traffic"] tag:2];
    UITabBarItem *tabBarItem4 = [[UITabBarItem alloc] initWithTitle:@"Contract Us" image:[UIImage imageNamed:@"traffic"] tag:3];
    //数组形式添加进 tabBar
    NSArray *tabBarItemArray = [[NSArray alloc]
                                initWithObjects:tabBarItem1, tabBarItem2, tabBarItem3, tabBarItem4, nil];
    [self.tabBar setItems:tabBarItemArray];
    //对tab栏定制 start
    [self.tabBar setBackgroundImage: [UIImage imageWithColor:BK_COLOR]];
    //隐藏那条黑线
    [self.tabBar setShadowImage:[UIImage imageWithColor:BK_COLOR]];
    [self.tabBar setTintColor:TINT_COLOR];
    [self.view addSubview:self.tabBar];
    self.tabBar.sd_layout
    .heightIs(tabBarHeight)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0);
    //

}



#pragma mark UIScrollviewdelegate
- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pagewidth = self.scrollView.frame.size.width;
    int page  = self.scrollView.contentOffset.x /pagewidth;
    page--;
   // _pageControl.currentPage = page;
   // _sgment.selectedSegmentIndex = page + 1;
  //  [_segmentedControl setSelectedIndex:page + 1 animated:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat fWidth = self.view.frame.size.width;
    CGFloat fHeight = self.view.frame.size.height;
    CGFloat pagewidth = self.scrollView.frame.size.width;
    int currentPage = self.scrollView.contentOffset.x /pagewidth;
    
     [_segmentedControl setSelectedIndex:currentPage animated:YES];
    //    if (currentPage==0)
    //    {
    //        [self.scrollView scrollRectToVisible:CGRectMake(fWidth * ([_slideTableViews count]-1),0,fWidth,fHeight) animated:NO]; // 序号0 最后1页
    //    }
    //    else if (currentPage==([_slideTableViews count]-1))
    //    {
    //        [self.scrollView scrollRectToVisible:CGRectMake(fWidth,0,fWidth,fHeight) animated:NO]; // 最后+1,循环第1页
    //    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)_scrollView willDecelerate:(BOOL)decelerate{
    
}



#pragma mark -
#pragma mark Event Hanlde

//-(void) tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
//{
//    NSLog(@"item.tag= %d", item.tag);
//}


//按钮点击事件
- (void) showLeftView {
    PKRevealController *revealController = self.parentViewController.parentViewController.revealController;
    [revealController showViewController:revealController.leftViewController];
    
//[self.navigationController.revealController showViewController:self.navigationController.revealController.leftViewController];
}

- (void) viewDidAppear:(BOOL)animated
{
 //   [self.lblWelcome setText:self.greetingMessage];
    static int firstTime = YES;
    if(firstTime)
    {
        _segmentedControl.selectedIndex = 0;
        firstTime = NO;
    }
   
}


@end
