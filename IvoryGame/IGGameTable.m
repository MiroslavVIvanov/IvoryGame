//
//  IGGameTable.m
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/6/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

#import "IGGameTable.h"

@implementation IGGameTable

@synthesize creatorOneSum = _creatorOneSum;
@synthesize creatorTwoSum = _creatorTwoSum;
@synthesize creatorThreeSum = _creatorThreeSum;
@synthesize creatorFourSum = _creatorFourSum;
@synthesize creatorFiveSum = _creatorFiveSum;
@synthesize creatorSixSum = _creatorSixSum;
@synthesize creatorPairSum = _creatorPairSum;
@synthesize creatorThreeEqualSum = _creatorThreeEqualSum;
@synthesize creatorSquareSum = _creatorSquareSum;
@synthesize creatorSmallSum = _creatorSmallSum;
@synthesize creatorBigSum = _creatorBigSum;
@synthesize creatorFullSum = _creatorFullSum;
@synthesize creatorGeneralSum = _creatorGeneralSum;
@synthesize creatorChanceSum = _creatorChanceSum;

@synthesize joinOneSum = _joinOneSum;
@synthesize joinTwoSum = _joinTwoSum;
@synthesize joinThreeSum = _joinThreeSum;
@synthesize joinFourSum = _joinFourSum;
@synthesize joinFiveSum = _joinFiveSum;
@synthesize joinSixSum = _joinSixSum;
@synthesize joinPairSum = _joinPairSum;
@synthesize joinThreeEqualSum = _joinThreeEqualSum;
@synthesize joinSquareSum = _joinSquareSum;
@synthesize joinSmallSum = _joinSmallSum;
@synthesize joinBigSum = _joinBigSum;
@synthesize joinFullSum = _joinFullSum;
@synthesize joinGeneralSum = _joinGeneralSum;
@synthesize joinChanceSum = _joinChanceSum;

+(IGGameTable *)create{
    IGGameTable *table = [IGGameTable object];
    table[@"creatorOneSum"] = @0;
    table[@"creatorTwoSum"] = @0;
    table[@"creatorThreeSum"] = @0;
    table[@"creatorFourSum"] = @0;
    table[@"creatorFiveSum"] = @0;
    table[@"creatorSixSum"] = @0;
    table[@"creatorPairSum"] = @0;
    table[@"creatorThreeEqualSum"] = @0;
    table[@"creatorSquareSum"] = @0;
    table[@"creatorSmallSum"] = @0;
    table[@"creatorBigSum"] = @0;
    table[@"creatorFullSum"] = @0;
    table[@"creatorGeneralSum"] = @0;
    table[@"creatorChanceSum"] = @0;
    
    table[@"joinOneSum"] = @0;
    table[@"joinTwoSum"] = @0;
    table[@"joinThreeSum"] = @0;
    table[@"joinFourSum"] = @0;
    table[@"joinFiveSum"] = @0;
    table[@"joinSixSum"] = @0;
    table[@"joinPairSum"] = @0;
    table[@"joinThreeEqualSum"] = @0;
    table[@"joinSquareSum"] = @0;
    table[@"joinSmallSum"] = @0;
    table[@"joinBigSum"] = @0;
    table[@"joinFullSum"] = @0;
    table[@"joinGeneralSum"] = @0;
    table[@"joinChanceSum"] = @0;
    
    return table;
}

+(void)load{
    [self registerSubclass];
}

+(NSString*) parseClassName{
    return @"GameTable";
}

@end
