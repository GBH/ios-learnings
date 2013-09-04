//
//  Deck.m
//  CardMatcher2000
//
//  Created by Oleg on 2013-08-29.
//  Copyright (c) 2013 Oleg. All rights reserved.
//

#import "Deck.h"
#import "Card.h"

@implementation Deck

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (id)init
{
    self = [super init];
    if (self){
        for (NSString *suit in [Card suits]) {
            for (NSString *rank in [Card ranks]){
                Card *card = [[Card alloc] initWithRank:rank andSuit:suit];
                [self.cards addObject:card];
            }
        }
    }
    return self;
}

- (Card *)drawCard
{
    int index = arc4random() % [self.cards count];
    Card *card = self.cards[index];
    [self.cards removeObjectAtIndex:index];
    return card;
}


@end
