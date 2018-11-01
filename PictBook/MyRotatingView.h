//
//  MyRotatingView.h
//  PictBook
//
//  Created by TA Trung Thanh on 27/10/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyRotatingView : UIView

@property (nonatomic, retain)  UILabel *labelPercent;
@property (nonatomic, retain)  UIToolbar *toolbar;
@property (nonatomic, retain)  UILabel *labelImage;
@property (nonatomic, retain)  UIBarButtonItem *barLabelImage;
@property (nonatomic, retain)  UIBarButtonItem *barButtonNext;
@property (nonatomic, retain)  UIBarButtonItem *barButtonPrevious;
@property (nonatomic, retain)  UISlider *sliderZoom;
@property (nonatomic, retain)  UIScrollView *scrollViewImage;




- (void) drawInFormat: (CGSize) format;
@end

NS_ASSUME_NONNULL_END
