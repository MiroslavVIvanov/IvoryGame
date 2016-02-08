//
//  IGGame.m
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/6/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

#import "IGGame.h"

@implementation IGGame

@synthesize gameName = _gameName;
@synthesize creatorPlayer = _creatorPlayer;
@synthesize joinedPlayer = _joinedPlayer;
@synthesize gameTable = _gameTable;
@synthesize gameLocation = _gameLocation;

+(void)load{
    [self registerSubclass];
}

+(NSString*) parseClassName{
    return @"Game";
}

@end
