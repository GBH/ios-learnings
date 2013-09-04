//
//  CM2KViewController.m
//  CardMatcher2000
//
//  Created by Oleg on 2013-08-28.
//  Copyright (c) 2013 Oleg. All rights reserved.
//

#import "CM2KViewController.h"
#import "Game.h"

@interface CM2KViewController ()

@property (strong, nonatomic) Game *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *actionLabel;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;

@end

@implementation CM2KViewController

- (IBAction)resetGame:(UIButton *)sender {
    [self loadGame];
    [self updateUI];
}

- (IBAction)flipCard:(UIButton *)sender {
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self updateUI];
}

- (void)updateUI
{
    for  (UIButton *cardButton in self.cardButtons){
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton set]
        [cardButton setTitle:card.content forState:UIControlStateSelected];
        [cardButton setTitle:card.content forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isPlayed;
        cardButton.alpha = card.isPlayed ? 0.3 : 1.0;
    }
    [self.scoreLabel setText:[NSString stringWithFormat:@"Score %d", self.game.score]];
    [self.actionLabel setText:self.game.lastAction];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self loadGame];
    [self updateUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadGame
{
    self.game = [[Game alloc] initWithCardCount:self.cardButtons.count];
}

@end
