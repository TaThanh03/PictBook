//
//  ViewController.m
//  PictBook
//
//  Created by TA Trung Thanh on 27/10/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

#import "ViewController.h"
#import "MyScrollView.h"

@interface ViewController ()

@end

MyScrollView *v;

NSArray *myArray;
NSInteger cpt = 0;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    v = [[MyScrollView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    myArray = [[NSArray arrayWithObjects:@"photo-1", @"photo-2", @"photo-3", @"photo-4", @"photo-5", nil] retain];
    [v setImageToScrollView:[myArray objectAtIndex:cpt]];
    [v setBackgroundColor:[UIColor whiteColor]];
    [self setView:v];
    [v release]; //because setView opperation has increase reference counter
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (void) actionBarButtonNextTouched: (UIBarButtonItem*) sender{
    if (cpt < [myArray count]-1) {
        cpt += 1;
        [v setImageToScrollView:[myArray objectAtIndex:cpt]];
        
    }
}
- (void) actionBarButtonPreviousTouched: (UIBarButtonItem*) sender{
    if (cpt > 0) {
        cpt -= 1;
        [v setImageToScrollView:[myArray objectAtIndex:cpt]];
    }
}
- (void) actionSliderTouched:(UISlider *) sender{
    [v setImageScale];
}

@end
