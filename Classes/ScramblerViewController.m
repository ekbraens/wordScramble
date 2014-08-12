//
//  ScramblerViewController.m
//  Scrambler
//
//  Created by user  on 3/31/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import "ScramblerViewController.h"

@implementation ScramblerViewController
@synthesize guessText, scrambledWord, remainingTime, playerScore;

- (IBAction)guessTap:(id)sender
{
	//Check the guess against the currentWord
	BOOL isGuessCorrect = [gameModel checkGuess:guessText.text];
	
	//clear the guess UI widget
	guessText.text = @"";
	
	if (isGuessCorrect)
	{
		if (gameModel.score==10)
		{
			// The game is over
			[self endGameWithMessage:@"You win!"];
		}
	}
	else
	{
		// Update the view with the next scrambled word
		scrambledWord.text = [gameModel getScrambledWord];
	}
	// update the view
	remainingTime.text = [NSString stringWithFormat:@"%i", gameModel.time];
	playerScore.text = [NSString stringWithFormat:@"%i", gameModel.score];
	
}

-(void) endGameWithMessage:(NSString *) message
{
	// Call this method to end the game
	// invalidate the timer
	[gameTimer invalidate];
	
	//show alert view with the results
	UIAlertView * gameOver = [[UIAlertView alloc] initWithTitle:@"Game Over" 
														message:message 
													   delegate:self 
											  cancelButtonTitle:[gameModel getUnscrambledWord] 
											  otherButtonTitles:nil];
	[gameOver show];
}

-(void)timerFired:(NSTimer *)theTimer
{
	// The timer fires this method every second
	[gameModel timerTick];
	
	if (gameModel.time <= 0)
	{
		remainingTime.text = 0;
		[self endGameWithMessage:@"You are out of time. You lose!"];
	}
	else 
	{
		remainingTime.text = [NSString stringWithFormat:@"%i", gameModel.time];
	}
	
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
	// Initialize the game model
	gameModel = [[ScramblerModel alloc] init];
	
	//Display the time, score the scrambled word in the view
	remainingTime.text = [NSString stringWithFormat:@"%i", gameModel.time];
	playerScore.text = [NSString stringWithFormat:@"%i", gameModel.score];
	scrambledWord.text = [gameModel getScrambledWord];
	
	//Start the game timer
	gameTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 
												 target:self 
											   selector:@selector(timerFired:) 
											   userInfo:nil 
												repeats:YES];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload 
{
	[self setGuessText:nil];
	[self setScrambledWord:nil];
	[self setRemainingTime:nil];
	[self setPlayerScore:nil];
	gameModel = nil;
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
	[gameModel release];
    [super dealloc];
}

@end
