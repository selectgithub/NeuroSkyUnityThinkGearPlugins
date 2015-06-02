/*
 *  TGAccessoryDelegate.h
 *
 *  Copyright 2012 NeuroSky, Inc.. All rights reserved.
 *
 *  Classes that act as the delegate for the TGAccessoryManager need to implement
 *  this protocol. The TGAccessoryManager fires off the messages in this protocol 
 *  when the appropriate events are seen.
 *
 *  All methods are required.
 */

#import <Foundation/Foundation.h>
#import <ExternalAccessory/ExternalAccessory.h>

@protocol TGAccessoryDelegate

- (void)dataReceived:(NSDictionary *)data;

@optional
- (void)accessoryDidConnect:(EAAccessory *)accessory;
- (void)accessoryDidDisconnect;

@end