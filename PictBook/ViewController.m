//
//  ViewController.m
//  PictBook
//
//  Created by TA Trung Thanh on 27/10/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

#import "ViewController.h"
#import "MyRotatingView.h"

@interface ViewController ()

@end

MyRotatingView *v;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    v = [[MyRotatingView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [v setBackgroundColor:[UIColor whiteColor]];
    [self setView:v];
    [v release]; //because setView opperation has increase reference counter
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (void) actionBarButtonNextTouched: (UIBarButtonItem*) sender{
    NSLog(@"tick");
}
- (void) actionBarButtonPreviousTouched: (UIBarButtonItem*) sender{
    NSLog(@"tick");
}

@end
