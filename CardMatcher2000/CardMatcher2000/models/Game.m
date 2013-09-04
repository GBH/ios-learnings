//
//  Game.m
//  CardMatcher2000
//
//  Created by Oleg on 2013-08-29.
//  Copyright (c) 2013 Oleg. All rights reserved.
//

#import "Game.h"
#import "Deck.h"
#import "Card.h"

@interface Game()

@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic, readwrite) NSInteger score;

@end

@implementation Game

- (NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

 - (id)initWithCardCount:(NSUInteger)cardCount
{
    self = [super init];
    if (self){
        Deck *deck = [[Deck alloc] init];
        for (int i = 0; i <= cardCount; i++){
            Card *card = [deck drawCard];
            [self.cards addObject:card];
        }
    }
    return self;
}

- (void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    // only 2 cards open at any given time
    NSPredicate *openCardPredicate = [NSPredicate predicateWithFormat:@"isFaceUp == YES AND isPlayed == NO"];
    int openCards = [self.cards filteredArrayUsingPredicate:openCardPredicate].count + 1;
    
    // finding another open card
    NSArray *otherCards = [self.cards filteredArrayUsingPredicate:openCardPredicate];
    Card *otherCard = nil;
    if (otherCards.count > 0) otherCard = otherCards[0];
    
    if ((openCards <= 2 || card.isFaceUp) && !card.isPlayed){
        card.isFaceUp = !card.isFaceUp;
        if (card.isFaceUp) {
            self.score--;
            self.lastAction = [NSString stringWithFormat:@"opened %@ for -1 points", card.content];
            
            // another card is present. we can match
            if (otherCard){
                int cardScore = [self matchScoreOf:card withCard:otherCard];
                self.score += cardScore;
                
                // successful match. burn cards
                if (cardScore > 0){
                    card.isPlayed = YES;
                    otherCard.isPlayed = YES;
                    self.lastAction = [NSString stringWithFormat:@"matched %@ and %@ for %d points", card.content, otherCard.content, cardScore];
                }
            }
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return [self.cards objectAtIndex:index];
}

- (int)matchScoreOf:(Card *)cardA
           withCard:(Card *)cardB
{
    int score = 0;
    if ([cardA.suit isEqualToString:cardB.suit]) score = 5;
    if ([cardA.rank isEqualToString:cardB.rank]) score = 10;
    return score;
}

@end
