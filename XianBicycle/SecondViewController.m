//
//  SecondViewController.m
//  XianBicycle
//
//  Created by Shuai Zhang on 7/11/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "SecondViewController.h"
#import "NSString+NSStringUtils.h"
#import "XianBicycleConfig.h"


@interface SecondViewController ()

@property(nonatomic) BMKSuggestionSearch *suggestSearcher;
@property(nonatomic) BMKGeoCodeSearch *geoSearcher;
@property(nonatomic) BicycleSuggestionResult *suggestionResult;

@end

@implementation BicycleSuggestionResult

@synthesize keyList;
@synthesize districtList;
@synthesize ptList;

-(instancetype)initWithCapacity:(NSUInteger) capacity
{
    if (self = [super init]) {
        self.keyList = [[NSMutableArray alloc] initWithCapacity:capacity];
        self.districtList = [[NSMutableArray alloc] initWithCapacity:capacity];
        self.ptList = [[NSMutableArray alloc] initWithCapacity:capacity];
    }
    return self;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBaiduMapSDK];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = NSLocalizedString(@"tab_search", nil);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    _suggestSearcher.delegate = nil;
    _geoSearcher.delegate = nil;
}

- (IBAction)doSearch:(id)sender {
    NSLog(@"start :%@", _startTextField.text);
    NSLog(@"end :%@", _endTextField.text);
    [self searchByKeyWord:_startTextField.text];
    [self getGeoByKeyWord:_endTextField.text];
}

#pragma mark - private methods
- (void)initBaiduMapSDK
{
    _suggestSearcher = [[BMKSuggestionSearch alloc] init];
    _suggestSearcher.delegate = self;
    _geoSearcher = [[BMKGeoCodeSearch alloc] init];
    _geoSearcher.delegate = self;
}

- (void)searchByKeyWord:(NSString *)keyword
{
    if ([NSString isBlankString:keyword]) {
        return;
    }
    BMKSuggestionSearchOption *option = [[BMKSuggestionSearchOption alloc] init];
    option.cityname = DEFAULT_CITY;
    option.keyword = keyword;
    BOOL flag = [_suggestSearcher suggestionSearch:option];
    if(flag) {
        NSLog(@"建议检索发送成功");
    } else {
        NSLog(@"建议检索发送失败");
    }
}

- (void)getGeoByKeyWord:(NSString *)keyword
{
    BMKGeoCodeSearchOption *geoCodeSearchOption = [[BMKGeoCodeSearchOption alloc]init];
    geoCodeSearchOption.city= DEFAULT_CITY;
    geoCodeSearchOption.address = keyword;
    BOOL flag = [_geoSearcher geoCode:geoCodeSearchOption];
    if(flag) {
        NSLog(@"geo检索发送成功");
    } else {
        NSLog(@"geo检索发送失败");
    }
}

- (void)displaySuggestionResult
{
    for(int i = 0; i < [_suggestionResult.keyList count];i++) {
        CLLocationCoordinate2D coordinate;
        [[_suggestionResult.ptList objectAtIndex: i]getValue:&coordinate];
        NSLog(@"%@ - %@, %f, %f", _suggestionResult.keyList[i], _suggestionResult.districtList[i], coordinate.latitude, coordinate.longitude);
    }
}

#pragma mark - BMKSuggestionSearchDelegate
- (void)onGetSuggestionResult:(BMKSuggestionSearch*)searcher result:(BMKSuggestionResult*)result errorCode:(BMKSearchErrorCode)error
{
    if (error == BMK_SEARCH_NO_ERROR) {
        _suggestionResult = nil;
        _suggestionResult = [[BicycleSuggestionResult alloc] initWithCapacity:[result.keyList count]];
        for (int i = 0; i < [result.keyList count]; i++) {
            if ([result.cityList[i] isEqualToString:DEFAULT_CITY]) {
                [_suggestionResult.keyList addObject:result.keyList[i]];
                [_suggestionResult.districtList addObject:result.districtList[i]];
                [_suggestionResult.ptList addObject:result.ptList[i]];
            }
        }
        [self displaySuggestionResult];
    } else {
        NSLog(@"抱歉，未找到结果");
        if (_suggestionResult == nil) {
            _suggestionResult = [[BicycleSuggestionResult alloc] initWithCapacity:0];
        }
        [_suggestionResult.keyList removeAllObjects];
        [_suggestionResult.districtList removeAllObjects];
        [_suggestionResult.ptList removeAllObjects];
    }
}

#pragma mark - BMKGeoCodeSearchDelegate
- (void)onGetGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    if (error == BMK_SEARCH_NO_ERROR) {
        //在此处理正常结果
        NSLog(@"%@, %f, %f", result.address, result.location.latitude, result.location.longitude);
    } else {
        NSLog(@"抱歉，未找到结果");
    }
}

#pragma mark - MLPAutoCompleteTextFieldDelegate
- (BOOL)autoCompleteTextField:(MLPAutoCompleteTextField *)textField
          shouldConfigureCell:(UITableViewCell *)cell
       withAutoCompleteString:(NSString *)autocompleteString
         withAttributedString:(NSAttributedString *)boldedString
        forAutoCompleteObject:(id<MLPAutoCompletionObject>)autocompleteObject
            forRowAtIndexPath:(NSIndexPath *)indexPath
{
    return true;
}


/*IndexPath corresponds to the order of strings within the autocomplete table,
 not the original data source.
 autoCompleteObject may be nil if the selectedString had no object associated with it.
 */
- (void)autoCompleteTextField:(MLPAutoCompleteTextField *)textField
  didSelectAutoCompleteString:(NSString *)selectedString
       withAutoCompleteObject:(id<MLPAutoCompletionObject>)selectedObject
            forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
