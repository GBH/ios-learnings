//
//  Game.h
//  CardMatcher2000
//
//  Created by Oleg on 2013-08-29.
//  Copyright (c) 2013 Oleg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface Game : NSObject

- (id)initWithCardCount:(NSUInteger)cardCount;
- (void)flipCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, nonatomic) NSString *lastAction;

@end
