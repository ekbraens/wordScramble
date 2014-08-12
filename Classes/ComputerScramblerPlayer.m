//
//  ComputerScramblerPlayer.m
//  Scrambler
//
//  Created by user  on 3/31/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import "ComputerScramblerPlayer.h"


@implementation ComputerScramblerPlayer

-(id)init
{
	self = [super init];
	if (self)
	{
		[self initializeWordList];
	}
	return self;
}

-(NSString *) scrambleWord:(NSString *) wordToScramble
{
	// This method scrambles a word
	
	// Allocate an array to hold the used numbers
	NSMutableSet * usedNumberSet = [[[NSMutableSet alloc] init] autorelease];
	
	// Allocate a string that you will use to build the output
	NSMutableString * outputString = [[[NSMutableString alloc] init] autorelease];
	
	// Loop the number of times that there are letters in the word
	for (int i = 0; i < [wordToScramble length]; ++i)
	{
		// pick a num
		int randomNum = random() % [wordToScramble length];
		// is the number in the set?
		while ([usedNumberSet containsObject:[NSNumber numberWithInt:randomNum]] == YES)
		{
			// if the number is in the list, you need to pick a different number
			randomNum = random() % [wordToScramble length];
		}
		// while the number is not already in the list, add it to the list of used numbers
		[usedNumberSet addObject:[NSNumber numberWithInt:randomNum]];
		//append the character at the position chosen tot he outputString
		[outputString appendFormat:@"%c", [wordToScramble characterAtIndex:randomNum]];
	}
	return outputString;
}

-(void) initializeWordList
{
	NSArray * masterWordList = [NSArray arrayWithObjects:
								@"well", @"coin", @"address", @"novel",
								@"mat", @"panther", @"chip", @"jump", @"scream",
								@"spring", @"toothpick", @"shampoo", @"value",
								@"buoy", @"skirt", @"general", @"ink",
								@"engineer", @"epidemic", @"parasite", @"menu",
								@"clay", @"sunglasses", @"ridge", @"noun", @"mill",
								@"antique", @"gang", @"planet", @"headline",
								@"ketchup", @"passion", @"queue", @"word", @"band",
								@"thief", @"mustard", @"seat", @"sofa",
								@"queue", @"flamenco", @"comet", @"pebble",
								@"herald", @"facotry", @"stew", @"loop",
								@"velcro", @"thermostat", @"loaf", @"leaf",
								@"salmon", @"curtain", nil];
	
	// Initalize the scrambled word list
	scrambledWords = [[NSMutableArray alloc] initWithCapacity:[masterWordList count]];
	
	// seed the random number generator
	srandom( time(NULL));
	int randomNum;
	
	// Choose 10 words and them to the chosen words mutable array
	for (int i = 0; i < 10; ++i)
	{
		// generate random number to pick word
		randomNum = (random() % [masterWordList count]);
		// add the word to the chosenWords mutable array
		[scrambledWords addObject:[masterWordList objectAtIndex:randomNum]];
	}
}

-(NSString *)getNextWord
{
	NSString * returnString = nil;
	
	if ([scrambledWords count] > 0)
	{
		// Get the string to return
		returnString = [scrambledWords objectAtIndex:0];
		
		// Remove the string from the array
		[scrambledWords removeObjectAtIndex:0];
	}
	return returnString;
}

-(int) getRemainingWordCount
{
	return [scrambledWords count];
}

-(void)dealloc
{
	[scrambledWords release];
	[super dealloc];
}
@end
