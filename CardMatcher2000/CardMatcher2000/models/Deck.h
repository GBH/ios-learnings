//
//  Deck.h
//  CardMatcher2000
//
//  Created by Oleg on 2013-08-29.
//  Copyright (c) 2013 Oleg. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Card.h"

@interface Deck : NSObject

- (Card *)drawCard;

@property (strong, nonatomic) NSMutableArray *cards; // of Card

@end
