//
//  ViewController.h
//  beacon
//
//  Created by kyasu on 2016/01/29.
//  Copyright © 2016年 kyasu. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MBCBeaconAdvertisementData.h"
#import <IOBluetooth/IOBluetooth.h>

@interface ViewController : NSViewController

@property (strong, nonatomic) CBPeripheralManager *manager;

- (IBAction)advertis:(NSButton *)sender;

@end

