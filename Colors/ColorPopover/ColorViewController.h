//
//  ColorViewController.h
//  Colors
//
//  Created by Gazolla on 01/09/12.
//  Copyright (c) 2012 Gazolla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GzColors.h"
#import "ColorButton.h"

@class ColorViewController;

@protocol ColorViewControllerDelegate<NSObject>

- (void)colorPopoverControllerDidSelectColor:(NSString *)hexColor;

@end

@interface ColorViewController : UIViewController{
    id <ColorViewControllerDelegate> __weak delegate;
}

@property (nonatomic, strong) NSMutableArray *buttonCollection;
@property (nonatomic, strong) NSArray *colorCollection;
@property (nonatomic, weak) id <ColorViewControllerDelegate> delegate;

@end
