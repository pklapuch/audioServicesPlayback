//
//  ViewController.m
//  AudioServicesPlaybackDemo
//
//  Created by Pawel Klapuch on 30/01/2019.
//  Copyright © 2019 Pawel Klapuch. All rights reserved.
//

#import "ViewController.h"
#import <AudioServicesPlayback/Playback.h>

@interface ViewController ()

@property (nonatomic, strong) Playback* playback;
    
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SystemSoundID beepSound = 1052;
    
    self.playback = [[Playback alloc] initWithSystemSoundID:beepSound];
    
    [self.playback addCompletion:^{
        NSLog(@"Did finish playing sound");
    }];
    
    [self.playback play];
}


@end
