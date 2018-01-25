//
//  HomeViewController.m
//  LJMap
//
//  Created by QQ on 2018/1/25.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "HomeViewController.h"
#import "HomeIconModel.h"
#import "HomeIconImageView.h"

@interface HomeViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong) UIScrollView * bgScrollerView;
@property(nonatomic,strong) UIImageView * mapImageView;
@property(nonatomic,strong) NSMutableArray * locationArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.bgScrollerView];
    [self.bgScrollerView addSubview:self.mapImageView];
    self.bgScrollerView.contentSize = CGSizeMake(self.mapImageView.frame.size.width, self.mapImageView.frame.size.height);
    self.bgScrollerView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    [self getLoactionData];
    [self setupLocations];
}

-(void)getLoactionData{
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"home" ofType:@"plist"];
    NSArray * array = [[NSArray alloc] initWithContentsOfFile:plistPath];
    self.locationArray = [NSMutableArray arrayWithCapacity:0];
    for (NSDictionary * dic in array) {
        HomeIconModel * model = [[HomeIconModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.locationArray addObject:model];
    }
}

-(void)setupLocations{
    for (HomeIconModel * model in self.locationArray) {
        HomeIconImageView * imageView = [[HomeIconImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 60)];
        imageView.model = model;
        [self.bgScrollerView addSubview:imageView];
    }
}

#pragma mark - lazy
-(UIImageView *)mapImageView{
    if (!_mapImageView) {
        UIImage * image = [UIImage imageNamed:@"home.jpg"];
        _mapImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1178, 979)];
        _mapImageView.image = image;
    }
    return _mapImageView;
}

-(UIScrollView *)bgScrollerView{
    if (!_bgScrollerView) {
        _bgScrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _bgScrollerView.bounces = NO;
        _bgScrollerView.showsVerticalScrollIndicator = NO;
        _bgScrollerView.showsHorizontalScrollIndicator = NO;
        _bgScrollerView.decelerationRate = NO;
    }
    return _bgScrollerView;
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
