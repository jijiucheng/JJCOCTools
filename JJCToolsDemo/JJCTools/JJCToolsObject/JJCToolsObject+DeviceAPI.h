//
//  JJCToolsObject+DeviceAPI.h
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2018/7/10.
//  Copyright © 2018 苜蓿鬼仙. All rights reserved.
//




/********************  说明  *******************/
/*
 
 
 JJCToolsObject+DeviceAPI
 创建：2018.07.10
 更新：2018.07.10
 
 
 1、该扩展主要用于获取手机硬件设备信息，包含手机网络信息；
 
 
 参考链接：
 https://www.cnblogs.com/zhanghuanan/p/5703644.html
 https://blog.csdn.net/ddreaming/article/details/53349753
 https://blog.csdn.net/u011467458/article/details/53422411
 https://blog.csdn.net/yanglei3kyou/article/details/50434848
 // 获取设备信息
 https://www.jianshu.com/p/b23016bb97af
 https://github.com/PengfeiWang666/iOS-getClientInfo
 // struct 与 id 类型互转
 https://blog.csdn.net/u010244140/article/details/50836422
 https://blog.csdn.net/stubbornness1219/article/details/50253301
 // 局域网 UDP 广播机制
 https://www.jianshu.com/p/97fbeb99db20
 https://www.cnblogs.com/qingche/p/3784451.html
 https://blog.csdn.net/li_yangyang_li/article/details/50844256
 
 */
/********************  说明  *******************/




#import "JJCToolsObject.h"

@interface JJCToolsObject (DeviceAPI)


/**
 获取当前设备所连接网络的  IP 地址
 
 inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)
 */
+ (NSString *)jjc_device_getNetworkIPAddress;


/**
 获取当前设备所连接网络的  广播地址（局域网IP地址、路由地址）
 
 inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_dstaddr)->sin_addr)
 */
+ (NSString *)jjc_device_getNetworkBroadcastAddress;


/**
 获取当前设备所连接网络的  子网掩码地址
 
 inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_netmask)->sin_addr)
 */
+ (NSString *)jjc_device_getNetworkNetmaskAddress;


/**
 获取当前设备所连接网络的  端口地址
 
 temp_addr->ifa_name
 
 en0    ：   Wi-Fi（WI-FI 接口）
 en1    ：   Thunderbolt 1（雷射接口1）
 en2    ：   Thunderbolt 2（雷射接口2）
 en3    ：   Bluetooth PAN（蓝牙接口）
 bridge0：   Thunderbolt Bridge（桥接接口）
 
 参考链接：https://blog.csdn.net/ddreaming/article/details/53349753
 */
+ (NSString *)jjc_device_getNetworkInterfaceAddress;


/**
 获取当前设备所连接网络的  MAC 地址
 
 Key：BSSID
 */
+ (NSString *)jjc_device_getNetworkMACAddress;


/**
 获取当前设备所连接网络的  WIFI 名称
 
 Key：SSID
 */
+ (NSString *)jjc_device_getNetworkWIFIName;




#pragma mark - 慎用
/***************************  以下方法慎用  ***************************/
/**
 下面的方法都是获取底层相关的数据，如果懂底层原理的可以选择使用
 */


/**
 获取当前设备所连接网络的  ifaddrs 原始数据
 
 如果正常返回数据，返回的数据类型为 NSValue 类型，存储的是 ifaddrs 结构体
 
 参考链接：https://blog.csdn.net/u010244140/article/details/50836422
 https://blog.csdn.net/stubbornness1219/article/details/50253301
 */
+ (NSValue *)jjc_device_getNetworkIfaddrs;


/**
 获取当前设备所连接网络的  网络信息（CNCopyCurrentNetworkInfo）
 
 如果正常放回数据，返回的数据类型为字典 NSDictionary，且包含三个字段：
 SSIDDATA：
 BSSID   ：MAC 地址
 SSID    ：WI-FI 名称
 */
+ (id)jjc_device_getNetworkInfo;


@end
