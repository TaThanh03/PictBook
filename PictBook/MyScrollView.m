//
//  MyScrollView.m
//  PictBook
//
//  Created by TA Trung Thanh on 01/11/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

#import "MyScrollView.h"
#import "ViewController.h"

@implementation MyScrollView

CGFloat border_bottom;
CGFloat border_head;
CGFloat border_side;
CGFloat centre;
CGFloat label_width;
CGFloat label_height;

- (void) setImageToScrollView: (NSString *)image {
    [_scrollVIew.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)]; 
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
    [_scrollVIew addSubview:_imageView];
    [_scrollVIew setContentSize:CGSizeMake(_imageView.image.size.width, _imageView.image.size.height)];
    [_scrollVIew setZoomScale: _scrollVIew.minimumZoomScale*2];
    [_imageView release];
    [self setPercent];
    [_labelImage setText:image];
    
}

- (void)setPercent {
    NSString *thePercent = [NSString stringWithFormat:@"%f%%", [_scrollVIew zoomScale]*100];
    [_labelPercent setText:thePercent];
    [_sliderZoom setValue:[_scrollVIew zoomScale]];
}

- (void)setImageScale {
    _scrollVIew.zoomScale = [_sliderZoom value];
    [self setPercent];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _labelImage = [[UILabel alloc]init];
        _labelPercent = [[UILabel alloc]init];
        _toolbar = [[UIToolbar alloc] init];
        _scrollVIew = [[UIScrollView alloc] init];
        _sliderZoom = [[UISlider alloc]init];
        [_sliderZoom addTarget:self.superview action:@selector(actionSliderTouched:) forControlEvents:UIControlEventValueChanged];
        _barLabelImage = [[UIBarButtonItem alloc]initWithCustomView:self.labelImage];
        _barButtonNext = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self.superview action:@selector(actionBarButtonNextTouched:)];
        _barButtonPrevious = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self.superview action:@selector(actionBarButtonPreviousTouched:)];
        
        [_labelImage setText:@"nothing"];
        
        UIVisualEffect *blurEffect;
        blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
        _visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        
        [_labelPercent setBackgroundColor:[UIColor clearColor]];
        [_labelPercent setTextColor:UIColor.darkTextColor];

        _scrollVIew.maximumZoomScale = 1.0;
        _scrollVIew.minimumZoomScale = 0.05;
        _scrollVIew.backgroundColor = UIColor.darkGrayColor;
        [_scrollVIew setZoomScale:0.2 animated:TRUE];
        [self setImageToScrollView:@"photo-1"];
        
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
        [_toolbar setBackgroundColor:[UIColor clearColor]];

        [self addSubview:_labelPercent];
        [self addSubview:_toolbar];
        [self addSubview:_sliderZoom];
        [self addSubview:_scrollVIew];
        [self addSubview:_visualEffectView];
        [self bringSubviewToFront:_toolbar];
        [self bringSubviewToFront:_sliderZoom];
        [self bringSubviewToFront:_labelPercent];
        
        [_labelPercent release];
        [_toolbar release];
        [_sliderZoom release];
        [_scrollVIew release];
        
        _scrollVIew.delegate = self; //self = target of protocol methods
        
        [self drawInFormat:[UIScreen mainScreen].bounds.size];
    }
    return self;
}

- (void) drawInFormat:(CGSize)format {
    NSLog(@"Scrollview w %f", format.width);
    NSLog(@"Scrollview h %f", format.height);
    
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
    
    [_visualEffectView  setFrame:CGRectMake( border_side, border_head, format.width - 2*border_side, label_height*2)];
    [_toolbar  setFrame:CGRectMake( border_side, border_head, format.width - 2*border_side, label_height)];
    [_labelPercent  setFrame:CGRectMake( centre - label_width/2, border_head + label_height, 240, label_height)];
    [_scrollVIew  setFrame:CGRectMake( border_side, border_head, format.width, format.height - border_head )];
    [_sliderZoom  setFrame:CGRectMake( border_side, border_bottom, format.width, label_height)];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _imageView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    _scrollVIew.zoomScale = scale;
    [self setPercent];
}

@end
