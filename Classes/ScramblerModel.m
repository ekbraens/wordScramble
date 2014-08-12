//
//  ScramblerModel.m
//  Scrambler
//
//  Created by user  on 3/31/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import "ScramblerModel.h"


@implementation ScramblerModel
@synthesize time, score;

- (id)init
{
	self = [super init];
	if (self)
	{
		// initialize the game model
		computerPlayer = [[ComputerScramblerPlayer alloc] init];
		// initialize time
		time = 60;
		// initialize score
		score = 0;
		// Get the first word from the list
		currentWord = [computerPlayer getNextWord];
	}
	return self;
}

-(BOOL) checkGuess:(NSString *) guess
{
	if ([guess isEqualToString:currentWord])
	{
		//Add one to the score
		score++;
		// Add 15 seconds to the timer
		time += 15;
		
		//If there are more words, pick the next word
		if ([computerPlayer getRemainingWordCount] > 0)
		{
			currentWord = [computerPlayer getNextWord];
		}
		else 
		{
			// No more words, so clean up
			currentWord = nil;
			
		}
	}
	else 
	{
		// Subtract 10 from the time
		time -= 10;
		return NO;
	}
}

-(NSString *)getUnscrambledWord
{
	return currentWord;
}

-(NSString *)getScrambledWord
{
	return [computerPlayer scrambleWord:currentWord];
}

-(void) timerTick
{
	time--;
}

@end
