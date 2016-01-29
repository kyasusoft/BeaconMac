//
//  ViewController.m
//  beacon
//
//  Created by kyasu on 2016/01/29.
//  Copyright © 2016年 kyasu. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@implementation ViewController{
    BOOL _bluetoothOn;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // CBPeripheralManagerを初期化
    self.manager = [[CBPeripheralManager alloc] initWithDelegate:(id)self
                                                           queue:nil];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    // Bluetoothがオンのときにアドバタイズする
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        _bluetoothOn = YES;
        
    } else {
        _bluetoothOn = NO;
    }
}

- (IBAction)advertis:(NSButton *)sender {
    
    if (sender.state == 1) {
        if (_bluetoothOn) {
            // UUIDを適当に作成
            NSUUID *proximityUUID = [[NSUUID alloc] initWithUUIDString:@"00000000-7588-1001-B000-001C4DD17CFA"];
            
            // アドバタイズ用のデータを作成
            MBCBeaconAdvertisementData *beaconData
            = [[MBCBeaconAdvertisementData alloc] initWithProximityUUID:proximityUUID
                                                                  major:1
                                                                  minor:1
                                                          measuredPower:-58];
            
            // アドバタイズ開始
            [self.manager startAdvertising:beaconData.beaconAdvertisement];
        }
    } else {
        if (_bluetoothOn) {
            // アドバタイズ終了
            [self.manager stopAdvertising];
        }
    }
}

@end
