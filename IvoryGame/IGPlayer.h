//
//  IGPlayer.h
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/5/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface IGPlayer : PFObject <PFSubclassing>

@property NSString* uniqueIdentifier;
@property NSString* visibleName;
@property PFFile* profilePicture;
@property NSInteger score;

+(IGPlayer*) initializePlayer;

+(void)load;
+(NSString*) parseClassName;

@end
