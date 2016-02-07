//
//  IGGameTable.h
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/6/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface IGGameTable : PFObject <PFSubclassing>

@property NSInteger creatorOneSum;
@property NSInteger creatorTwoSum;
@property NSInteger creatorThreeSum;
@property NSInteger creatorFourSum;
@property NSInteger creatorFiveSum;
@property NSInteger creatorSixSum;
@property NSInteger creatorPairSum;
@property NSInteger creatorThreeEqualSum;
@property NSInteger creatorSquareSum;
@property NSInteger creatorSmallSum;
@property NSInteger creatorBigSum;
@property NSInteger creatorFullSum;
@property NSInteger creatorGeneralSum;
@property NSInteger creatorChanceSum;

@property NSInteger joinOneSum;
@property NSInteger joinTwoSum;
@property NSInteger joinThreeSum;
@property NSInteger joinFourSum;
@property NSInteger joinFiveSum;
@property NSInteger joinSixSum;
@property NSInteger joinPairSum;
@property NSInteger joinThreeEqualSum;
@property NSInteger joinSquareSum;
@property NSInteger joinSmallSum;
@property NSInteger joinBigSum;
@property NSInteger joinFullSum;
@property NSInteger joinGeneralSum;
@property NSInteger joinChanceSum;

+(IGGameTable *) create;
@end
