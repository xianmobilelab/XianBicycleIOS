//
//  FirstViewController.m
//  XianBicycle
//
//  Created by Shuai Zhang on 7/11/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "FirstViewController.h"
#import "XianBicycleConfig.h"
#import "ResponseBicycleSet.h"
#import "CommonUtils.h"
#import <CRToast/CRToast.h>

@interface FirstViewController ()

@property (nonatomic) BMKMapView *mapView;
@property (nonatomic) BMKLocationService *locService;
@property (nonatomic) CLLocationCoordinate2D loc;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initBaiduMap];
    _service = [[XianBicycleService alloc] init];
    
    UIBarButtonItem *item =
    [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"btn_search", nil)
                                     style:UIBarButtonItemStylePlain target:self action:@selector(searchCurrentLocation)];
    
    self.navigationItem.rightBarButtonItem = item;
    self.navigationItem.title = NSLocalizedString(@"tab_nearby", nil);
}

- (void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self;
    _locService.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil;
    _locService.delegate = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)initBaiduMap {
    if (_mapView == nil) {
        _mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 0, XIANBICYCLE_SCREEN_WIDTH, XIANBICYCLE_SCREEN_HEIGHT)];
    }
    [_mapView setZoomLevel:ZOOM_LEVEL];
    [self.view insertSubview:_mapView atIndex:0];
#if TARGET_IPHONE_SIMULATOR
    _loc = {DEFAULT_LAT, DEFAULT_LONG};
    [_mapView setCenterCoordinate:_loc];
#endif
}

- (void)searchCurrentLocation
{
    // Set location
    NSLog(@"进入普通定位态");
    //初始化BMKLocationService
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    //启动LocationService
    [_locService startUserLocationService];
    NSLog(@"进入跟随态");
    _mapView.showsUserLocation = NO;//先关闭定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;//设置定位的状态
    _mapView.showsUserLocation = YES;//显示定位图层
}

- (void)doSearchByTerm: (NSString *)term {
    RequestTerm *request = [[RequestTerm alloc] init];
    [request setTerm:term];
    [_service searchByTerm:request withDelegate:self];
}

- (void)doSearchByLocation: (CLLocationCoordinate2D) location withDistance: (double) distance {
    RequestLocation *requestLocation = [[RequestLocation alloc] init];
    requestLocation.lat = [[NSNumber alloc] initWithDouble:location.latitude];
    requestLocation.lng = [[NSNumber alloc] initWithDouble:location.longitude];
    requestLocation.distance = [[NSNumber alloc] initWithDouble:distance];
    [_service searchByLocation:requestLocation withDelegate:self];
}

- (void)addMarkerToMap: (BicycleSetItem *) item
{
    // 添加一个PointAnnotation
    NSLog(@"%@, %@", item.sitename, item.location);
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor;
    coor.latitude = item.latitude;
    coor.longitude = item.longitude;
    annotation.coordinate = coor;
    annotation.title =  item.sitename;
    [_mapView addAnnotation:annotation];
}

- (void)showErrorAlertView:(NSString *)title withMessage:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:NSLocalizedString(@"btn_cancel", nil) otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)showLocationSuccessfulToast
{
    NSDictionary *options = @{
                              kCRToastTextKey : NSLocalizedString(@"msg_location", nil),
                              kCRToastTextAlignmentKey : @(NSTextAlignmentCenter),
                              kCRToastBackgroundColorKey : UIColorFromRGBA(0x45ee5e, 1.0),
                              kCRToastTextColorKey : [UIColor blackColor],
                              kCRToastAnimationInTypeKey : @(CRToastAnimationTypeGravity),
                              kCRToastAnimationOutTypeKey : @(CRToastAnimationTypeGravity),
                              kCRToastAnimationInDirectionKey : @(CRToastAnimationDirectionLeft),
                              kCRToastAnimationOutDirectionKey : @(CRToastAnimationDirectionRight)
                              };
    [CRToastManager showNotificationWithOptions:options completionBlock:^{}];
}

#pragma mark - Service protocol
- (void)getDecodedData:(id)data withCode:(long)code
{
    if (code == NetworkCodeNoError) {
        if ([data isKindOfClass:[ResponseBicycleSet class]]) {
            ResponseBicycleSet *response = data;
            NSArray *siteList = response.siteList;
            for (int i = 0; i < [siteList count]; i++) {
                BicycleSetItem *item = [siteList objectAtIndex:i];
                [self addMarkerToMap:item];
            }
        }
    } else {
        NSString *title = NSLocalizedString(@"msg_error", nil);
        NSString *message = NSLocalizedString(@"msg_network_failed", nil);
        [self showErrorAlertView:title withMessage:message];
    }
}

#pragma mark - BaiduMap Delegate

//实现相关delegate 处理位置信息更新
//处理方向变更信息
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [_mapView updateLocationData:userLocation];
    NSLog(@"heading is %@",userLocation.heading);
}

//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    [self showLocationSuccessfulToast];
    [_mapView updateLocationData:userLocation];
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    _loc = userLocation.location.coordinate;
    [_locService stopUserLocationService];
    
    // start search by location
    [self doSearchByLocation:_loc withDistance:1000.0];
}

- (void)didStopLocatingUser
{
    NSLog(@"Stop Location");
}

- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSString *title = NSLocalizedString(@"msg_error", nil);
    NSString *message = NSLocalizedString(@"msg_location_failed", nil);
    [self showErrorAlertView:title withMessage:message];
}

- (IBAction)search:(id)sender {
    [self searchCurrentLocation];
}
@end
