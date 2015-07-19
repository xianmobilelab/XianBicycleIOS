//
//  SecondViewController.h
//  XianBicycle
//
//  Created by Shuai Zhang on 7/11/15.
//  Copyright (c) 2015 ZhangShuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>

@interface SecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *endTextField;
@property (weak, nonatomic) IBOutlet UITextField *startTextField;

- (IBAction)doSearch:(id)sender;


@end

