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
 https://blog.csdn.net/qq_26075861/article/details/78361363
 https://www.jianshu.com/p/5a19c789bd19
 https://www.jianshu.com/p/9ccd8c8e4f3d
 http://www.ituring.com.cn/article/472021
 
 */
/********************  说明  *******************/




#import "JJCToolsObject.h"

@interface JJCToolsObject (DeviceAPI)


#pragma mark - Hardware

/**
 获取当前设备  唯一标识符
 
 备注：
 UUID 是 Universally Unique Identifier 的缩写，中文意思是通用唯一识别码。它是让分布式系统中的所有元素，都能有唯一的辨识资讯，而不需要透过中央控制端来做辨识资讯的指定。这样，每个人都可以建立不与其它人冲突的 UUID。在此情况下，就不需考虑数据库建立时的名称重复问题。苹果公司建议使用UUID为应用生成唯一标识字符串。
 */
+ (NSString *)jjc_device_getDeviceUUIDString;


/**
 获取当前设备  唯一广告位标识符
 
 备注：
 IDFA（广告位标识符）：在同一个设备上的所有App都会取到相同的值，是苹果专门给各广告提供商用来追踪用户而设的，用户可以在 设置|隐私|广告追踪里重置此id的值，或限制此id的使用，故此id有可能会取不到值，但好在Apple默认是允许追踪的，而且一般用户都不知道有这么个设置，所以基本上用来监测推广效果，是戳戳有余了
 */
+ (NSString *)jjc_device_getDeviceIDFAString;




#pragma mark - Network

/**
 获取当前设备所连接网络的  IP 地址
 
 inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)
 */
+ (NSString *)jjc_device_getNetworkIPAddress;


/**
 获取当前设备所连接网络的  广播地址
 
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
 
 备注：
 ① MAC 地址是 ethernet（以太网）规定接入 internet 设备必须具备的网卡，发送端和接收端便是指网卡的地址；
 ② 每块王凯出厂时都被烧制上世界上唯一的 MAC 地址，长度为 48 位二进制，通常由 12 位 16 进制数表示（前六位表示厂商编号，后六位表示流水线号）；
 ③ 格式：02:88:65:3e:a1:ec
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
