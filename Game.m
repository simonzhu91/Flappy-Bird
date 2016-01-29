//
//  Game.m
//  Flappy Bird Tutorial
//
//  Created by KAKA on 5/16/15.
//  Copyright (c) 2015 Simon Zhu. All rights reserved.
//

#include <stdlib.h>
#import "Game.h"

@interface Game ()

@end

// Bird Only Moves Up and Down
// Tunnels Move Right to Left

// Game will increase in difficulty as you continue

// Tunnel Movement Speed Increases
// Tunnel Heights Increases

@implementation Game

CGFloat TunnelMovementSpeed;
NSInteger TunnelHeights;

- (IBAction)StartGame:(id)sender{
    
    StartGame.hidden = YES;
    TunnelTop.hidden = NO;
    TunnelBottom.hidden = NO;
    
    // resets TunnelHeights and TunnelMovementSpeed
    TunnelHeights = 100;
    TunnelMovementSpeed = 1;
    
    BirdMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BirdMoving) userInfo:nil repeats:YES];
    
    
    // when the game starts calls the method PlaceTunnels
    [self PlaceTunnels];
    
    TunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(TunnelMoving) userInfo:nil repeats:YES];
}

- (void)PlaceTunnels{
    
//    [TunnelTop setFrame: CGRectMake(0, 0, 50, 200)];
//    [TunnelBottom setFrame: CGRectMake(0, 0, 50, 200)];

    // if you go up, y coordinate is negative
    // if you go down, y coordinate is positive
    // top left is (0,0) for IOS
    
    // image size doesn't matter, it scales it to UIImage
    
    //y between -228 and 122
//    RandomTopTunnelPosition = arc4random() % 350;
//    RandomTopTunnelPosition = RandomTopTunnelPosition - 228;
    
    //change 655 to change game difficulty
//    RandomBottomTunnelPosition = RandomTopTunnelPosition + 655;
    
//    TunnelTop.center = CGPointMake(340, RandomTopTunnelPosition);
//    TunnelBottom.center = CGPointMake(340, RandomBottomTunnelPosition);

    
    // height of screen is 667
    [TopTunnelHeight setConstant: TunnelHeights + arc4random() % 50];
    [BottomTunnelHeight setConstant: TunnelHeights + arc4random() % 50];
    
}


- (void) BirdMoving{
    
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y - BirdFlight);
    
    BirdFlight = BirdFlight - 5;
    
    // limits the speed at which the bird falls
    if(BirdFlight < -10){
        BirdFlight = -10;
    }
    
    // toggles the bird icon
    if(BirdFlight > 0){
        Bird.image = [UIImage imageNamed:@"Bird Up.png"];
    }
    if(BirdFlight < 0){
        Bird.image = [UIImage imageNamed:@"Bird Down.png"];
    }
    
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    BirdFlight = 30;
}

-(void) TunnelMoving{
    
    if(ScoreNumber > 1){
        TunnelMovementSpeed = (CGFloat)(0.1 * ScoreNumber + 1);
    }
    
    NSLog(@"%f", TunnelMovementSpeed);
    
    TunnelTop.center = CGPointMake(TunnelTop.center.x - TunnelMovementSpeed, TunnelTop.center.y);
    TunnelBottom.center = CGPointMake(TunnelBottom.center.x - TunnelMovementSpeed, TunnelBottom.center.y);
  
    
    // Tracks the score, we only need 1 Tunnel Top since the tunnels are always above each other
    if(TunnelTop.center.x <= 0){
        [self Score];
        
        // if Tunnels go off screen, replace tunnels randomly
        [self PlaceTunnels];
    }
    
    if(CGRectIntersectsRect(Bird.frame, TunnelTop.frame)){
        [self GameOver];
    }
    
    if(CGRectIntersectsRect(Bird.frame, TunnelBottom.frame)){
        [self GameOver];
    }
    
    if(CGRectIntersectsRect(Bird.frame, Top.frame)){
        [self GameOver];
    }
    
    if(CGRectIntersectsRect(Bird.frame, Bottom.frame)){
        [self GameOver];
    }

    
}

- (void) GameOver {
    
    if(ScoreNumber > HighScoreNumber){
        [[NSUserDefaults standardUserDefaults]setInteger: ScoreNumber forKey: @"HighScoreSaved"];
    }
    
    // Stop 2 buttons
    [TunnelMovement invalidate];
    [BirdMovement invalidate];
    
    Exit.hidden = NO;
    TunnelTop.hidden = YES;
    TunnelBottom.hidden = YES;
    Bird.hidden = YES;
    
    

}



// whenever the gamer has passed through the gap
- (void) Score {
    
    ScoreNumber += 1;
    ScoreLabel.text = [NSString stringWithFormat: @"%i", ScoreNumber];

    // adjust tunnelHeights
    // for now, it is a constant value, but we want a percentage of the screen
    // if the height is 40% or more of the screen height, we adjust the screen height
    
    if(TunnelHeights >= ([[UIScreen mainScreen] bounds].size.height * 0.4)){
        TunnelHeights = ([[UIScreen mainScreen] bounds].size.height * 0.4);
    }else{
        TunnelHeights += 10;
    }
    
}


- (void)viewDidLoad {
    
    // hides Tunnels before the game begins
    TunnelTop.hidden = YES;
    TunnelBottom.hidden = YES;
    
    // hides the Exit Button and sets score to 0
    Exit.hidden = YES;
    ScoreNumber = 0;
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
