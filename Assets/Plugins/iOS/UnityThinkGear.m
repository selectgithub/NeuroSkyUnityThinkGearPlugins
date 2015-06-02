//
//  UnityThinkGear.m
//  Unity-iPhone
//
//  Created by NeuroSky on 3/27/13.
//
//

#import "UnityThinkGear.h"

@implementation UnityThinkGear

- (id)initWithRawEnable:(bool)rawEnable{
    self = [super init];
    if(self){
        [self setSendRawEnable:rawEnable];
        [self setSendEEGEnable:true];
        [self setSendESenseEnable:true];
        [self setSendBlinkEnable:true];
    }
    return self;
}

- (void)accessoryDidConnect:(EAAccessory *)accessory {
    // start the data stream to the accessory
    [[TGAccessoryManager sharedTGAccessoryManager] startStream];
}

- (void)accessoryDidDisconnect {

}

- (void)dataReceived:(NSDictionary *)data {
    //[data retain];
    
    if(sendRawEnable){
        UnitySendMessage("ThinkGear", "receiveRawdata", [[NSString stringWithFormat:@"%d",[[data valueForKey:@"raw"] shortValue]] cStringUsingEncoding:NSUTF8StringEncoding]);
    }
    
    if([data valueForKey:@"blinkStrength"] && sendBlinkEnable){
        UnitySendMessage("ThinkGear", "receiveBlink", [[NSString stringWithFormat:@"%d",[[data valueForKey:@"blinkStrength"] intValue]] cStringUsingEncoding:NSUTF8StringEncoding]);
    }
    
    if([data valueForKey:@"eSenseAttention"]){
        UnitySendMessage("ThinkGear", "receivePoorSignal", [[NSString stringWithFormat:@"%d",[[data valueForKey:@"poorSignal"] intValue]] cStringUsingEncoding:NSUTF8StringEncoding]);
        
        if(sendESenseEnable){
            UnitySendMessage("ThinkGear", "receiveAttention", [[NSString stringWithFormat:@"%d",[[data valueForKey:@"eSenseAttention"] intValue]] cStringUsingEncoding:NSUTF8StringEncoding]);
            UnitySendMessage("ThinkGear", "receiveMeditation", [[NSString stringWithFormat:@"%d",[[data valueForKey:@"eSenseMeditation"] intValue]] cStringUsingEncoding:NSUTF8StringEncoding]);
        }
        
        if(sendEEGEnable){
            UnitySendMessage("ThinkGear", "receiveDelta", [[NSString stringWithFormat:@"%f",[[data valueForKey:@"eegDelta"] floatValue]] cStringUsingEncoding:NSUTF8StringEncoding]);
            UnitySendMessage("ThinkGear", "receiveTheta", [[NSString stringWithFormat:@"%f",[[data valueForKey:@"eegTheta"] floatValue]] cStringUsingEncoding:NSUTF8StringEncoding]);
            UnitySendMessage("ThinkGear", "receiveLowAlpha", [[NSString stringWithFormat:@"%f",[[data valueForKey:@"eegLowAlpha"] floatValue]] cStringUsingEncoding:NSUTF8StringEncoding]);
            UnitySendMessage("ThinkGear", "receiveHighAlpha", [[NSString stringWithFormat:@"%f",[[data valueForKey:@"eegHighAlpha"] floatValue]] cStringUsingEncoding:NSUTF8StringEncoding]);
            UnitySendMessage("ThinkGear", "receiveLowBeta", [[NSString stringWithFormat:@"%f",[[data valueForKey:@"eegLowBeta"] floatValue]] cStringUsingEncoding:NSUTF8StringEncoding]);
            UnitySendMessage("ThinkGear", "receiveHighBeta", [[NSString stringWithFormat:@"%f",[[data valueForKey:@"eegHighBeta"] floatValue]] cStringUsingEncoding:NSUTF8StringEncoding]);
            UnitySendMessage("ThinkGear", "receiveLowGamma", [[NSString stringWithFormat:@"%f",[[data valueForKey:@"eegLowGamma"] floatValue]] cStringUsingEncoding:NSUTF8StringEncoding]);
            UnitySendMessage("ThinkGear", "receiveHighGamma", [[NSString stringWithFormat:@"%f",[[data valueForKey:@"eegHighGamma"] floatValue]] cStringUsingEncoding:NSUTF8StringEncoding]);
        }
    }
}//end (void)dataReceived

- (bool)getSendRawEnable{
    NSLog(@"Raw");
    return sendRawEnable;
}
- (bool)getSendEEGEnable{
    NSLog(@"EEG");
    return sendEEGEnable;
}
- (bool)getSendESenseEnable{
    NSLog(@"ESense");
    return sendESenseEnable;
}

- (bool)getSendBlinkEnable{
    NSLog(@"Blink");
    return sendBlinkEnable;
}

- (void)setSendRawEnable:(bool)value{
    value?NSLog(@"SetRaw:True"):NSLog(@"SetRaw:False");
    sendRawEnable = value;
}
- (void)setSendEEGEnable:(bool)value{
    value?NSLog(@"SetEEG:True"):NSLog(@"SetEEG:False");
    sendEEGEnable = value;
}
- (void)setSendESenseEnable:(bool)value{
    value?NSLog(@"SetESense:True"):NSLog(@"SetSEnse:False");
    sendESenseEnable = value;
}
- (void)setSendBlinkEnable:(bool)value{
    value?NSLog(@"SetBlink:True"):NSLog(@"SetBlink:False");
    sendBlinkEnable = value;
    
}

@end





















