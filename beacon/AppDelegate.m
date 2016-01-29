//
//  AppDelegate.m
//  beacon
//
//  Created by kyasu on 2016/01/29.
//  Copyright © 2016年 kyasu. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // CBPeripheralManagerを初期化
    self.manager = [[CBPeripheralManager alloc] initWithDelegate:self
                                                           queue:nil];
}

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    // Bluetoothがオンのときにアドバタイズする
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        
        // UUIDを適当に作成
        NSUUID *proximityUUID = [[NSUUID alloc] initWithUUIDString:@"00000000-7588-1001-B000-001C4DD17CFA"];
        
        // アドバタイズ用のデータを作成
        MBCBeaconAdvertisementData *beaconData
        = [[MBCBeaconAdvertisementData alloc] initWithProximityUUID:proximityUUID
                                                              major:1
                                                              minor:1
                                                      measuredPower:-58];
        
        // アドバタイズ開始
        [peripheral startAdvertising:beaconData.beaconAdvertisement];
    }
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
