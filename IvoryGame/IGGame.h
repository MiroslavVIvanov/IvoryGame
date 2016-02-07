//
//  IGGame.h
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/6/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

#import "IGPlayer.h"
#import "IGGameTable.h"

@interface IGGame : PFObject <PFSubclassing>

@property NSString* gameName;
@property IGPlayer* creatorPlayer;
@property IGPlayer* joinedPlayer;
@property IGGameTable* gameTable;
@property PFGeoPoint* location;

+(void)load;
+(NSString*) parseClassName;

@end
