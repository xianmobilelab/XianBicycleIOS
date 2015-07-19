//
//  SecondViewController.m
//  XianBicycle
//
//  Created by Shuai Zhang on 7/11/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import "SecondViewController.h"


@interface SecondViewController ()

@end

@implementation BicycleSuggestionResult

@synthesize keyList;
@synthesize districtList;
@synthesize ptList;

-(id)initWithCapacity:(NSUInteger) capacity
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
    _searcher = [[BMKSuggestionSearch alloc] init];
    _searcher.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = NSLocalizedString(@"tab_search", nil);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    _searcher.delegate = nil;
}

- (IBAction)doSearch:(id)sender {
    NSLog(@"start :%@", _startTextField.text);
    NSLog(@"end :%@", _endTextField.text);
    [self searchByKeyWord:_startTextField.text];
}

#pragma mark - private methods
- (void)searchByKeyWord:(NSString *)keyword
{
    BMKSuggestionSearchOption *option = [[BMKSuggestionSearchOption alloc] init];
    option.cityname = @"西安市";
    option.keyword = keyword;
    BOOL flag = [_searcher suggestionSearch:option];
    if(flag)
    {
        NSLog(@"建议检索发送成功");
    }
    else
    {
        NSLog(@"建议检索发送失败");
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
            if ([result.cityList[i] isEqualToString:@"西安市"]) {
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

@end
