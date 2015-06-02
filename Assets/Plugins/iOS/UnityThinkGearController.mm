//
//  UnityThinkGearController.m
//  Unity-iPhone
//
//  Created by NeuroSky on 3/27/13.
//
//

#import "UnityThinkGearController.h"

static UnityThinkGear *unityThinkGearObj;

@implementation UnityThinkGearController

@end

extern "C" {
    
    void TGAM_Init(bool rawEnabled) {
        
        NSLog(@"TGAM_Init");
        
        TGAccessoryType accessoryType = (TGAccessoryType) 0;
        
        if(rawEnabled) {
            [[TGAccessoryManager sharedTGAccessoryManager] setupManagerWithInterval:0.0015 forAccessoryType:accessoryType];
        }
        else {
            [[TGAccessoryManager sharedTGAccessoryManager] setupManagerWithInterval:0.2 forAccessoryType:accessoryType];
        }
        
        unityThinkGearObj = [[UnityThinkGear alloc] initWithRawEnable:rawEnabled];
        
        [[TGAccessoryManager sharedTGAccessoryManager] setDelegate:unityThinkGearObj];
        [[TGAccessoryManager sharedTGAccessoryManager] setRawEnabled:rawEnabled]; 
    }
    
    void TGAM_Close() {
        // perform TGAccessoryManager teardown
        [[TGAccessoryManager sharedTGAccessoryManager] teardownManager];
    }
    
    void TGAM_StartStream() {
        
        NSLog(@"TGAM_StartStream");

        if([[TGAccessoryManager sharedTGAccessoryManager] accessory] != nil)
            [[TGAccessoryManager sharedTGAccessoryManager] startStream];
        
    }
    
    void TGAM_StopStream() {
        if([[TGAccessoryManager sharedTGAccessoryManager] connected])
            [[TGAccessoryManager sharedTGAccessoryManager] stopStream];
        
    }

    bool TGAM_GetSendRawEnable(){
        NSLog(@"RawTT");
        return [unityThinkGearObj getSendRawEnable];
    }
    
    bool TGAM_GetSendEEGEnable(){
        NSLog(@"EEGTT");
        return [unityThinkGearObj getSendEEGEnable];
    }
    
    bool TGAM_GetSendESenseEnable(){
        NSLog(@"ESenseTT");
        return [unityThinkGearObj getSendESenseEnable];
    }
    
    bool TGAM_GetSendBlinkEnable(){
        NSLog(@"BlinkTT");
        return [unityThinkGearObj getSendBlinkEnable];
    }
    
    void TGAM_SetSendRawEnable(bool enabled){
        enabled?NSLog(@"SetRawT:True"):NSLog(@"SetRawT:False");
        [unityThinkGearObj setSendRawEnable:enabled];
    }
    
    void TGAM_SetSendEEGEnable(bool enabled){
        enabled?NSLog(@"SetEEGT:True"):NSLog(@"SetEEGT:False");
        [unityThinkGearObj setSendEEGEnable:enabled];
    }
    
    void TGAM_SetSendESenseEnable(bool enabled){
        enabled?NSLog(@"SetESenseT:True"):NSLog(@"SetSEnseT:False");
        [unityThinkGearObj setSendESenseEnable:enabled];
    }
    
    void TGAM_SetSendBlinkEnable(bool enabled){
        enabled?NSLog(@"SetBlinkT:True"):NSLog(@"SetBlinkT:False");
        [unityThinkGearObj setSendBlinkEnable:enabled];
    }

}






