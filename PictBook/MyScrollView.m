//
//  MyScrollView.m
//  PictBook
//
//  Created by TA Trung Thanh on 01/11/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

#import "MyScrollView.h"

@implementation MyScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _scrollVIew.frame = frame;
        _scrollVIew.maximumZoomScale = 1.0;
        _scrollVIew.minimumZoomScale = 0.05;
        _scrollVIew.backgroundColor = UIColor.greenColor;
        [_scrollVIew addSubview:_imageView];
        [_scrollVIew setZoomScale:0.2 animated:TRUE];
        [self addSubview:_scrollVIew];
        [_scrollVIew release];
        
        _scrollVIew.delegate = self; //self = target of protocol methods
        
        [self drawInFormat:[UIScreen mainScreen].bounds.size];
    }
    return self;
}

- (void) drawInFormat:(CGSize)format {
    NSLog(@"Scrollview w %f", format.width);
    NSLog(@"Scrollview h %f", format.height);
    [_scrollVIew  setFrame:CGRectMake( 0 , 0, format.width, format.height)];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _imageView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    _scrollVIew.zoomScale = scale;
}

@end
