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

@end

NS_ASSUME_NONNULL_END
