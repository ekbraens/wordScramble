//
//  ComputerScramblerPlayer.h
//  Scrambler
//
//  Created by user  on 3/31/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ComputerScramblerPlayer : NSObject 
{
	NSMutableArray * scrambledWords;
}

-(NSString *) getNextWord;
-(NSString *) scrambleWord:(NSString *) wordToScramble;
-(int) getRemainingWordCount;
-(void) initializeWordList;

@end
