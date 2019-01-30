//
//  Playback.m
//  testAudio
//
//  Created by Pawel Klapuch on 30/01/2019.
//  Copyright © 2019 Bosch. All rights reserved.
//

#import "Playback.h"
#import <AudioToolbox/AudioToolbox.h>

@interface Playback ()
    
@property (nonatomic, assign) SystemSoundID resourceID;
@property (nonatomic, copy) AudioServicesCompletionBlock completionBlock;
    
@end

@implementation Playback

- (instancetype)initWithSystemSoundID:(SystemSoundID)soundID {
    
    self = [super init];
    if (self) {
        self.resourceID = soundID;
    }
    
    return self;
}

- (void)addCompletion:(AudioServicesCompletionBlock)block {
    
    self.completionBlock = block;
}

- (void)play {
    
    AudioServicesPlayAlertSound(self.resourceID);
    AudioServicesAddSystemSoundCompletion (self.resourceID, NULL, NULL, completionCallback, (__bridge void*)self);
}

- (void)didFinishPlayingSoundID:(SystemSoundID)soundID {
    
    self.completionBlock();
}

static void completionCallback(SystemSoundID soundID, void *instance) {
    
    AudioServicesRemoveSystemSoundCompletion(soundID);
    AudioServicesDisposeSystemSoundID(soundID);
    
    Playback *sender = (__bridge Playback *)instance;
    [sender didFinishPlayingSoundID:soundID];
}

@end
