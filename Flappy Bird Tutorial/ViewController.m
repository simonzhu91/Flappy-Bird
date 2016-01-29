//
//  ViewController.m
//  Flappy Bird Tutorial
//
//  Created by KAKA on 5/16/15.
//  Copyright (c) 2015 Simon Zhu. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    HighScore_Number =  [[NSUserDefaults standardUserDefaults] integerForKey: @"HighScoreSaved"];
    
    HighScore.text = [NSString stringWithFormat: @"High Score: %li",  (long) HighScore_Number];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

// Shares on Facebook
- (IBAction)ShareToFacebook:(id)sender {
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *fbSheetOBJ = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
//        NSString * str
        
        [fbSheetOBJ setInitialText:[NSString stringWithFormat:@"My Flappy Bird High Score is: %d !", HighScore_Number]];
        [self presentViewController:fbSheetOBJ animated:YES completion:Nil];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
