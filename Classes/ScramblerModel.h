//
//  ScramblerModel.h
//  Scrambler
//
//  Created by user  on 3/31/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ComputerScramblerPlayer.h"

@interface ScramblerModel : NSObject 
{
	ComputerScramblerPlayer * computerPlayer;
	int time;
	int score;
	NSString * currentWord;
}
@property (readonly) int time;
@property (readonly) int score;

-(NSString *)getScrambledWord;
-(BOOL) checkGuess:(NSString *) guess;
-(void) timerTick;
-(NSString *)getUnscrambledWord; 

@end
