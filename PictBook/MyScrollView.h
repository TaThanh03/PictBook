//
//  MyScrollView.h
//  PictBook
//
//  Created by TA Trung Thanh on 01/11/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyScrollView : UIView <UIScrollViewDelegate>

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIScrollView *scrollVIew;

@property (nonatomic, retain)  UILabel *labelPercent;
@property (nonatomic, retain)  UIToolbar *toolbar;
@property (nonatomic, retain)  UILabel *labelImage;
@property (nonatomic, retain)  UIBarButtonItem *barLabelImage;
@property (nonatomic, retain)  UIBarButtonItem *barButtonNext;
@property (nonatomic, retain)  UIBarButtonItem *barButtonPrevious;
@property (nonatomic, retain)  UISlider *sliderZoom;

@property (nonatomic, retain)  UIVisualEffectView *visualEffectView;


- (void) setImageToScrollView: (NSString *) image;
- (void) setPercent;
- (void) setImageScale;

@end

NS_ASSUME_NONNULL_END
