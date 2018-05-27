//
//  YJEJ_DaoHangViewController.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/9.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_DaoHangViewController.h"
#import <BaiduMapAPI_Map/BMKMapView.h>
#import <BaiduMapAPI_Location/BMKLocationService.h>
#import <BaiduMapAPI_Search/BMKRouteSearch.h>
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>

@interface YJEJ_DaoHangViewController ()<BMKMapViewDelegate, BMKLocationServiceDelegate>

@property (nonatomic ,strong)BMKMapView *mapView;
@property (nonatomic,strong) BMKLocationService *locService;

@end

@implementation YJEJ_DaoHangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"导航";
    [self layoutView];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _mapView.delegate = self;
    _locService.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    _mapView.delegate = nil;
    _locService.delegate = nil;
}

-(void) layoutView
{
    //初始化地图view
    _mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
    _mapView.showsUserLocation = NO;
    _mapView.userTrackingMode = BMKUserTrackingModeNone;
    _mapView.showsUserLocation = YES;
    _mapView.mapType = BMKMapTypeStandard;
    [_mapView setZoomLevel:17.5];
    self.view = _mapView;
    
    
    
    //开启定位服务
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    [_locService startUserLocationService];
}

#pragma mark ==========  地理位置更新  =========

- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    NSLog(@"heading is %@",userLocation.heading);
    [_mapView updateLocationData:userLocation];
}

- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    [_mapView updateLocationData:userLocation];

    //将当前位置止于视图中心
    if (_mapView) {
        [_mapView setCenterCoordinate:userLocation.location.coordinate animated:YES];
    }
    [_locService stopUserLocationService];
    
    
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
