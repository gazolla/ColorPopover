//
//  ViewController.m
//  Colors
//
//  Created by Gazolla on 31/08/12.
//  Copyright (c) 2012 Gazolla. All rights reserved.
//

#import "ViewController.h"
#import "GzColors.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize btn;
@synthesize popoverController;


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setBtn:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
#pragma mark WEPopoverControllerDelegate implementation

- (void)popoverControllerDidDismissPopover:(WEPopoverController *)thePopoverController {
	//Safe to release the popover here
	self.popoverController = nil;
}

- (BOOL)popoverControllerShouldDismissPopover:(WEPopoverController *)thePopoverController {
	//The popover is automatically dismissed if you click outside it, unless you return NO here
	return YES;
}


#pragma mark -
#pragma mark Button event implementation

- (IBAction)buttonTapped:(id)sender {
    if (!self.popoverController) {
		
		ColorViewController *contentViewController = [[ColorViewController alloc] init];
        contentViewController.delegate = self;
		self.popoverController = [[WEPopoverController alloc] initWithContentViewController:contentViewController];
		self.popoverController.delegate = self;
		self.popoverController.passthroughViews = [NSArray arrayWithObject:self.navigationController.navigationBar];
		
		[self.popoverController presentPopoverFromRect:btn.frame
                                                inView:self.view
                              permittedArrowDirections:(UIPopoverArrowDirectionUp|UIPopoverArrowDirectionDown)
                                              animated:YES];
        
	} else {
		[self.popoverController dismissPopoverAnimated:YES];
		self.popoverController = nil;
	}

}

-(void) colorPopoverControllerDidSelectColor:(NSString *)hexColor{
    self.view.backgroundColor = [GzColors colorFromHex:hexColor];
    [self.view setNeedsDisplay];
    [self.popoverController dismissPopoverAnimated:YES];
    self.popoverController = nil;
}
@end
