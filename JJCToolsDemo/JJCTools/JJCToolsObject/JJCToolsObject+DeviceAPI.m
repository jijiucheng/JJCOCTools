//
//  JJCToolsObject+DeviceAPI.m
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2018/7/10.
//  Copyright © 2018 苜蓿鬼仙. All rights reserved.
//

#import "JJCToolsObject+DeviceAPI.h"

#import <SystemConfiguration/CaptiveNetwork.h>
#import <AdSupport/AdSupport.h>

// 下面是获取ip需要的头文件
#import <ifaddrs.h>
#import <sys/socket.h> // Per msqr
#import <sys/ioctl.h>
#import <net/if.h>
#import <arpa/inet.h>



typedef NS_ENUM(NSInteger, JJCToolsDeviceAPIType) {
    JJCToolsDeviceAPITypeIPAddress = 0,        // IP 地址
    JJCToolsDeviceAPITypeBroadcastAddress,     // 广播地址（局域网IP地址、路由地址）
    JJCToolsDeviceAPITypeNetmaskAddress,       // 子网掩码地址
    JJCToolsDeviceAPITypeInterfaceAddress,     // 端口地址
    JJCToolsDeviceAPITypeRouterAddress         // 路由器地址
};


@implementation JJCToolsObject (DeviceAPI)


#pragma mark --------------------
#pragma mark --------------------  Hardware  --------------------

/**
 获取当前设备  唯一标识符
 
 备注：
 UUID 是 Universally Unique Identifier 的缩写，中文意思是通用唯一识别码。它是让分布式系统中的所有元素，都能有唯一的辨识资讯，而不需要透过中央控制端来做辨识资讯的指定。这样，每个人都可以建立不与其它人冲突的 UUID。在此情况下，就不需考虑数据库建立时的名称重复问题。苹果公司建议使用UUID为应用生成唯一标识字符串。
 */
+ (NSString *)jjc_device_getDeviceUUIDString {
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}


/**
 获取当前设备  唯一广告位标识符
 
 备注：
 IDFA（广告位标识符）：在同一个设备上的所有App都会取到相同的值，是苹果专门给各广告提供商用来追踪用户而设的，用户可以在 设置|隐私|广告追踪里重置此id的值，或限制此id的使用，故此id有可能会取不到值，但好在Apple默认是允许追踪的，而且一般用户都不知道有这么个设置，所以基本上用来监测推广效果，是戳戳有余了
 */
+ (NSString *)jjc_device_getDeviceIDFAString {
    return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
}



#pragma mark --------------------
#pragma mark --------------------  Network  --------------------

/**
 获取当前设备所连接网络的  详细信息
 */
+ (NSString *)jjc_device_getNetworkIfaddrsInfoWithNetworkAPIType:(JJCToolsDeviceAPIType)deviceAPIType {
    
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        //*/
        while(temp_addr != NULL)
        /*/
         int i=255;
         while((i--)>0)
         //*/
        {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String //ifa_addr
                    //ifa->ifa_dstaddr is the broadcast address, which explains the "255's"
                    
                    switch (deviceAPIType) {
                        case JJCToolsDeviceAPITypeIPAddress: {
                            /** IP 地址 **/
                            address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                        }
                            break;
                        case JJCToolsDeviceAPITypeBroadcastAddress: {
                            /** 广播地址（局域网IP地址、路由地址） **/
                            address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_dstaddr)->sin_addr)];
                        }
                            break;
                        case JJCToolsDeviceAPITypeNetmaskAddress: {
                            /** 子网掩码地址 **/
                            address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_netmask)->sin_addr)];
                        }
                            break;
                        case JJCToolsDeviceAPITypeInterfaceAddress: {
                            /** 端口地址 **/
                            address = [NSString stringWithUTF8String:temp_addr->ifa_name];
                        }
                            break;
                        case JJCToolsDeviceAPITypeRouterAddress: {
                            /** 路由器地址 **/
                            address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                        }
                            break;
                        default:
                            break;
                    }
                }
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    // Free memory
    freeifaddrs(interfaces);
    
    return address;
}



/**
 获取当前设备所连接网络的  IP 地址
 
 inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)
 */
+ (NSString *)jjc_device_getNetworkIPAddress {
    return [self jjc_device_getNetworkIfaddrsInfoWithNetworkAPIType:JJCToolsDeviceAPITypeIPAddress];
}


/**
 获取当前设备所连接网络的  广播地址
 
 inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_dstaddr)->sin_addr)
 */
+ (NSString *)jjc_device_getNetworkBroadcastAddress {
    return [self jjc_device_getNetworkIfaddrsInfoWithNetworkAPIType:JJCToolsDeviceAPITypeBroadcastAddress];
}


/**
 获取当前设备所连接网络的  子网掩码地址
 
 inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_netmask)->sin_addr)
 */
+ (NSString *)jjc_device_getNetworkNetmaskAddress {
    return [self jjc_device_getNetworkIfaddrsInfoWithNetworkAPIType:JJCToolsDeviceAPITypeNetmaskAddress];
}


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
+ (NSString *)jjc_device_getNetworkInterfaceAddress {
    return [self jjc_device_getNetworkIfaddrsInfoWithNetworkAPIType:JJCToolsDeviceAPITypeInterfaceAddress];
}


/**
 获取当前设备所连接网络的  MAC 地址
 
 Key：BSSID
 
 备注：
 ① MAC 地址是 ethernet（以太网）规定接入 internet 设备必须具备的网卡，发送端和接收端便是指网卡的地址；
 ② 每块王凯出厂时都被烧制上世界上唯一的 MAC 地址，长度为 48 位二进制，通常由 12 位 16 进制数表示（前六位表示厂商编号，后六位表示流水线号）；
 ③ 格式：02:88:65:3e:a1:ec
 */
+ (NSString *)jjc_device_getNetworkMACAddress {
    
    id info = [self jjc_device_getNetworkInfo];
    if (info && [info isKindOfClass:[NSDictionary class]]) {
        NSDictionary *infoDic = (NSDictionary *)info;
        if (infoDic.count > 0) {
            NSString *macAddress = [infoDic objectForKey:@"BSSID"];
            return macAddress;
        }
    }
    
    return nil;
}


/**
 获取当前设备所连接网络的  WIFI 名称
 
 Key：SSID
 */
+ (NSString *)jjc_device_getNetworkWIFIName {
    
    id info = [self jjc_device_getNetworkInfo];
    if (info && [info isKindOfClass:[NSDictionary class]]) {
        NSDictionary *infoDic = (NSDictionary *)info;
        if (infoDic.count > 0) {
            NSString *macAddress = [infoDic objectForKey:@"SSID"];
            return macAddress;
        }
    }
    
    return nil;
}




#pragma mark --------------------
#pragma mark --------------------  慎用  --------------------
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
+ (NSValue *)jjc_device_getNetworkIfaddrs {
    
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
    }
    
    // Free memory
    freeifaddrs(interfaces);
    
    NSValue *value = [NSValue valueWithBytes:&temp_addr objCType:@encode(struct ifaddrs)];
    return value;
}


/**
 获取当前设备所连接网络的  网络信息（CNCopyCurrentNetworkInfo）
 
 如果正常放回数据，返回的数据类型为字典 NSDictionary，且包含三个字段：
 SSIDDATA：
 BSSID   ：MAC 地址
 SSID    ：WI-FI 名称
 */
+ (id)jjc_device_getNetworkInfo {
    
    NSArray *ifs = (id)CFBridgingRelease(CNCopySupportedInterfaces());
    
    id info = nil;
    for (NSString *ifnam in ifs) {
        info = (id)CFBridgingRelease(CNCopyCurrentNetworkInfo((CFStringRef)ifnam));
        if (info && [info count]) {
            break;
        }
    }
    
    return info;
}


@end
