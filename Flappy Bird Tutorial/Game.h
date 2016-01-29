//
//  Game.h
//  Flappy Bird Tutorial
//
//  Created by KAKA on 5/16/15.
//  Copyright (c) 2015 Simon Zhu. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdFlight;
int RandomTopTunnelPosition;
int RandomBottomTunnelPosition;
int ScoreNumber;
NSInteger HighScoreNumber;

@interface Game : UIViewController
{
    // declaration of instance variables inside of the Interface
    IBOutlet UIImageView * Bird;
    IBOutlet UIImageView * TunnelTop;
    IBOutlet UIImageView * TunnelBottom;
    IBOutlet UIImageView * Top;
    IBOutlet UIImageView * Bottom;
    
    IBOutlet UIButton * StartGame;
    __weak IBOutlet UILabel *ScoreLabel;
    __weak IBOutlet UIButton *Exit;
    
    NSTimer * TunnelMovement;
    NSTimer * BirdMovement;
}

// declaration of the methods inside of the Interface
-(IBAction)StartGame:(id)sender;
-(void)BirdMoving;
-(void)PlaceTunnels;
-(void)TunnelMoving;
-(void)Score;
-(void)GameOver;


@end
