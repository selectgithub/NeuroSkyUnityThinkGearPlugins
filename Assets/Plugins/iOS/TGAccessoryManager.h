//
//  TGAccessoryManager.h
//
//  Copyright 2012 NeuroSky, Inc.. All rights reserved.
//
//  The TGAccessoryManager class handles ThinkGear-enabled accessories connected to a device,
//  sending accessory connect/disconnect and data receipt notifications to a designated delegate.
//


#import <Foundation/Foundation.h>
#import <ExternalAccessory/ExternalAccessory.h>
#import <UIKit/UIKit.h>
#import "TGAccessoryDelegate.h"

#pragma mark ThinkGear accessory types

enum {
    TGAccessoryTypeDongle = 0,
    TGAccessoryTypeSimulated = 2,
    TGAccessoryTypeStream = 3,
};
typedef NSUInteger TGAccessoryType;

//#import "TGAccessoryDelegate.h"
// why do we need both
@protocol TGRespirationDelegate <NSObject>
- (void)respirationDetected:(float)rate;
@end

@interface TGAccessoryManager : NSObject <EAAccessoryDelegate, NSStreamDelegate, TGRespirationDelegate> {
    EAAccessory * accessory;

    id<TGAccessoryDelegate> delegate;
    NSTimeInterval dispatchInterval;
    
    BOOL connected;
    BOOL rawEnabled;
    BOOL logEnabled;
    
    TGAccessoryType accessoryType;
    
    NSString * protocolString;
    NSTimer* readTimeoutTimer;
    
    //int inputAge;
}

#pragma mark -
#pragma mark Properties

@property (nonatomic, readonly) EAAccessory * accessory;
@property (nonatomic, readonly) BOOL connected;
@property (nonatomic, assign) id<TGAccessoryDelegate> delegate;
@property (nonatomic, assign) NSTimeInterval dispatchInterval;
@property (nonatomic, copy) NSString * protocolString;

@property BOOL rawEnabled;
@property BOOL respirationEnabled;
@property int inputAge;
@property (readonly) BOOL isCardioChip;
@property (readonly) BOOL isChipDetectionFinished;

#pragma mark -
#pragma mark Messages

+ (TGAccessoryManager *)sharedTGAccessoryManager;
- (void)setupManagerWithInterval:(NSTimeInterval)dispatchIntervalOrNil;
- (void)setupManagerWithInterval:(NSTimeInterval)dispatchIntervalOrNil forAccessoryType:(TGAccessoryType)type;
- (void)setupManagerWithInterval:(NSTimeInterval)dispatchIntervalOrNil forAccessoryProtocol:(NSString*)protocol;
- (void)setupManagerWithInputStream:(NSInputStream *)input OutputStream:(NSOutputStream *)output;
- (void)teardownManager;
- (void)startStream;
- (void)stopStream;
- (int)getVersion;

- (NSString *)enableLogging;
- (NSString *)enableLoggingWithOptions:(uint)options;
- (NSString *)enableLoggingWithPath:(NSString *)path withOptions:(uint)options;
- (void)stopLogging;
@end
