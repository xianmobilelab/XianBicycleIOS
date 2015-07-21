//
//  SecondViewController.h
//  XianBicycle
//
//  Created by Shuai Zhang on 7/11/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>
#import "MLPAutoCompleteTextFieldDelegate.h"

@interface BicycleSuggestionResult : NSObject

///key列表，成员是NSString
@property (nonatomic, strong) NSMutableArray* keyList;
///district列表，成员是NSString
@property (nonatomic, strong) NSMutableArray* districtList;
///pt列表，成员是：封装成NSValue的CLLocationCoordinate2D
@property (nonatomic, strong) NSMutableArray* ptList;

-(instancetype)initWithCapacity:(NSUInteger) capacity;

@end

@interface SecondViewController : UIViewController <BMKSuggestionSearchDelegate, BMKGeoCodeSearchDelegate, MLPAutoCompleteTextFieldDelegate> 

@property (weak, nonatomic) IBOutlet UITextField *endTextField;
@property (weak, nonatomic) IBOutlet UITextField *startTextField;

- (IBAction)doSearch:(id)sender;


@end

