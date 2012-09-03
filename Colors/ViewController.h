//
//  ViewController.h
//  Colors
//
//  Created by Gazolla on 31/08/12.
//  Copyright (c) 2012 Gazolla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "WEPopoverController.h"
#import "ColorViewController.h"


@interface ViewController : UIViewController<WEPopoverControllerDelegate, UIPopoverControllerDelegate, ColorViewControllerDelegate> {
	WEPopoverController *popoverController;
}
@property (strong, nonatomic) IBOutlet UIButton *btn;

@property (nonatomic, strong) WEPopoverController *popoverController;
- (IBAction)buttonTapped:(id)sender;



@end
