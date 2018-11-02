//
//  MyRotatingView.m
//  PictBook
//
//  Created by TA Trung Thanh on 27/10/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

#import "MyRotatingView.h"
#import "ViewController.h"

@implementation MyRotatingView

CGFloat border_bottom;
CGFloat border_head;
CGFloat border_side;
CGFloat centre;
CGFloat label_width;
CGFloat label_height;


- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _labelImage = [[UILabel alloc]init];
        _labelPercent = [[UILabel alloc]init];
        _toolbar = [[UIToolbar alloc] init];
        _sliderZoom = [[UISlider alloc]init];
        _scrollViewImage = [[UIScrollView  alloc]init];
        _barLabelImage = [[UIBarButtonItem alloc]initWithCustomView:self.labelImage];
        _barButtonNext = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self.superview action:@selector(actionBarButtonNextTouched:)];
        _barButtonPrevious = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self.superview action:@selector(actionBarButtonPreviousTouched:)];
         
        [_labelImage setText:@"nothing"];
        [_labelPercent setText:@"%"];
        [_scrollViewImage setBackgroundColor:UIColor.grayColor];

        UIImageView *imageTest = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-1"]];
        [_scrollViewImage addSubview:imageTest];
        [_scrollViewImage setContentSize:CGSizeMake(imageTest.image.size.width, imageTest.image.size.height)];
        [imageTest release];
        
        NSMutableArray *items = [[NSMutableArray alloc] init];
        [items addObject:[_barButtonPrevious autorelease]];
        UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        [items addObject:spacer];
        [spacer release];
        [items addObject:[_barLabelImage autorelease]];
        UIBarButtonItem *spacer2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        [items addObject:spacer2];
        [spacer2 release];
        [items addObject:[_barButtonNext autorelease]];
        [_toolbar setItems:items animated:NO];
        [items release];
        
        [self addSubview:_labelPercent];
        [self addSubview:_toolbar];
        [self addSubview:_sliderZoom];
        [self addSubview:_scrollViewImage];
        
        [_labelPercent release];
        [_toolbar release];
        [_sliderZoom release];
        [_scrollViewImage release];
        
        
        [self drawInFormat:[UIScreen mainScreen].bounds.size];
    }
    return self;
}

- (void) drawInFormat:(CGSize)format {
    NSLog(@"w %f", format.width);
    NSLog(@"h %f", format.height);
    centre = format.width/2;
    if (format.height <  540.0 ) {
        border_head = 10.0;
        border_bottom = format.height-30.0;
        border_side = 0.0;
        label_width = format.width - 160;
        label_height = 30;
    }
    else {
        border_head = 20.0;
        border_bottom = format.height-40.0;
        border_side = 0.0;
        label_width = format.width - 100;
        label_height = 30;
    }
    
    [_toolbar  setFrame:CGRectMake( border_side , border_head, format.width - 2*border_side , label_height)];
    [_labelPercent  setFrame:CGRectMake( centre - label_width/2, border_head + label_height, 200, label_height)];
    [_scrollViewImage  setFrame:CGRectMake( border_side, border_head + 2*label_height, format.width, format.height - 4.5*label_height)];
    [_sliderZoom  setFrame:CGRectMake( border_side, border_bottom, format.width, label_height)];
    
}

@end
