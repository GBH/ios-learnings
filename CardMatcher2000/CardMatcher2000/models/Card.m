//
//  Card.m
//  CardMatcher2000
//
//  Created by Oleg on 2013-08-28.
//  Copyright (c) 2013 Oleg. All rights reserved.
//

#import "Card.h"

@implementation Card

+ (NSArray *)suits
{
    return @[@"♠", @"♣", @"♥", @"♦"];
}

+ (NSArray *)ranks
{
    return @[@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

- (id)initWithRank:(NSString *)rank
           andSuit:(NSString *)suit
{
    self = [super init];
    if (self){
        self.rank = rank;
        self.suit = suit;
    }
    return self;
}

- (NSString *)content
{
    return [NSString stringWithFormat:@"%@ %@", self.suit, self.rank];
}

@end
