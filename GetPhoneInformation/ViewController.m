//
//  ViewController.m
//  GetPhoneInformation
//
//  Created by ym on 16/9/1.
//  Copyright © 2016年 王宁. All rights reserved.
//

#import "ViewController.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIDevice *device = [[UIDevice alloc]init];
//    获取设备所有者的名称
    NSLog(@"设备所有者名称：%@",device.name);
//    获取设备的类别
    NSLog(@"设备类别：%@",device.model);
//    本地化版本
    NSLog(@"本地化版本：%@",device.localizedModel);
//    获取当前版本
    NSLog(@"当前系统版本  %@",device.systemVersion);
//    获取当前系统
    NSLog(@"当前系统  %@",device.systemName);
//    获取唯一表示符ID
     NSLog(@"系统唯一标示符  %@",[[[UIDevice currentDevice ] identifierForVendor] UUIDString]);
//    检测真机模拟还是模拟器：输出-1为模拟器，输出0-1为真机
     NSLog(@"电量   %f",[[UIDevice currentDevice] batteryLevel]);
//    获取当前语言
    NSArray *languageArray = [NSLocale preferredLanguages];
    NSString *language = [languageArray objectAtIndex:0];
    NSLog(@"语言：%@", language);
    
//    获取当前的国别
    NSLocale *locale = [NSLocale currentLocale];
    NSString *country = [locale localeIdentifier];
    NSLog(@"国家：%@", country); //国别
    
//    获取运营商消息
    CTTelephonyNetworkInfo *infomation = [[CTTelephonyNetworkInfo alloc] init];
    
//    获取运营商的名称
    CTCarrier *carrier = [infomation subscriberCellularProvider];
    NSString *mCarrier = [NSString stringWithFormat:@"%@",[carrier carrierName]];
    NSLog(@"%@", mCarrier);
#pragma mark App应用相关参数获取
    NSDictionary *dicInfo = [[NSBundle mainBundle] infoDictionary];
    NSLog(@"应用所有信息 %@",dicInfo);
    NSString *strAppName = [dicInfo objectForKey:@"CFBundleDisplayName"];
    NSLog(@"App应用名称：%@", strAppName);
    NSString *strAppVersion = [dicInfo objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"App应用版本：%@", strAppVersion);
    NSString *strAppBuild = [dicInfo objectForKey:@"CFBundleVersion"];
    NSLog(@"App应用Build版本：%@", strAppBuild);
    NSString *strAppBundleIdentifier = [dicInfo objectForKey:@"CFBundleIdentifier"];
    NSLog(@"App应用唯一标示符：%@", strAppBundleIdentifier);

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
