//
//  ViewController.m
//  Flappy Bird Tutorial
//
//  Created by KAKA on 5/16/15.
//  Copyright (c) 2015 Simon Zhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    HighScore_Number =  [[NSUserDefaults standardUserDefaults] integerForKey: @"HighScoreSaved"];
    
    HighScore.text = [NSString stringWithFormat: @"High Score: %li",  (long) HighScore_Number];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
