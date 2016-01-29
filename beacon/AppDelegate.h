//
//  AppDelegate.h
//  beacon
//
//  Created by kyasu on 2016/01/29.
//  Copyright © 2016年 kyasu. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <IOBluetooth/IOBluetooth.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, CBPeripheralManagerDelegate>

@property (assign) IBOutlet NSWindow *window;

@end

