//
//  IGPlayer.m
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/5/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

#import "IGPlayer.h"
#import <Parse/PFObject+Subclass.h>


@implementation IGPlayer
@synthesize uniqueIdentifier = _uniqueIdentifier;
@synthesize visibleName = _visibleName;
@synthesize profilePicture = _profilePicture;
@synthesize score = _score;

+(IGPlayer *)initializePlayer{
    IGPlayer *player = [IGPlayer object];

    NSString *deviceId = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    player[@"uniqueIdentifier"] = deviceId;
    
    player[@"visibleName"] = @"Unknown player";

    player[@"score"] = @0;
    
    UIImage *defaultProfileImg = [UIImage imageNamed:@"default-profile-pic"];
    NSData *imageData = UIImagePNGRepresentation(defaultProfileImg);
    player[@"profilePicture"] = [PFFile fileWithData:imageData];

    return player;
}

+(void)load{
    [self registerSubclass];
}

+(NSString*) parseClassName{
    return @"Player";
}

@end
