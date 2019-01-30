//
//  Playback.h
//  testAudio
//
//  Created by Pawel Klapuch on 30/01/2019.
//  Copyright © 2019 Bosch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^AudioServicesCompletionBlock)(void);

@interface Playback : NSObject

- (instancetype)initWithSystemSoundID:(SystemSoundID)soundID;
    
- (void)addCompletion:(AudioServicesCompletionBlock)block;
    
- (void)play;

@end

NS_ASSUME_NONNULL_END
