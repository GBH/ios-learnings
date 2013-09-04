//
//  Card.h
//  CardMatcher2000
//
//  Created by Oleg on 2013-08-28.
//  Copyright (c) 2013 Oleg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

+ (NSArray *)suits;
+ (NSArray *)ranks;

- (id)initWithRank:(NSString *)rank
           andSuit:(NSString *)suit;
- (NSString *)content;

@property (strong, nonatomic) NSString *suit;
@property (strong, nonatomic) NSString *rank;
@property (nonatomic) BOOL isFaceUp;
@property (nonatomic) BOOL isPlayed;

@end
