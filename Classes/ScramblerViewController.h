//
//  ScramblerViewController.h
//  Scrambler
//
//  Created by user  on 3/31/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScramblerModel.h"

@interface ScramblerViewController : UIViewController 
{
	ScramblerModel * gameModel;
	NSTimer * gameTimer;
}
@property (nonatomic, retain) IBOutlet UITextField * guessText;
@property (nonatomic, retain) IBOutlet UILabel * scrambledWord;
@property (nonatomic, retain) IBOutlet UILabel * remainingTime;
@property (nonatomic, retain) IBOutlet UILabel * playerScore;

-(IBAction)guessTap:(id)sender;

-(void) endGameWithMessage:(NSString *) message;
@end

