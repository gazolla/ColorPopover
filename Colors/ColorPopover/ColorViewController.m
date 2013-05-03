//
//  ColorViewController.m
//  Colors
//
//  Created by Gazolla on 01/09/12.
//  Copyright (c) 2012 Gazolla. All rights reserved.
//

#import "ColorViewController.h"

@interface ColorViewController ()
@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, strong) NSArray* colorButtons;
@end

@implementation ColorViewController

const CGSize kPortraitContentSize = { 240, 250 };
const CGSize kLandscapeContentSize = { 320, 170 };

@synthesize delegate;

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation))
	{
		self.contentSizeForViewInPopover = kPortraitContentSize;
	}
	else
	{
		self.contentSizeForViewInPopover = kLandscapeContentSize;
	}
    
	CGRect scrollViewFrame = CGRectZero;
	scrollViewFrame.size = self.contentSizeForViewInPopover;
	self.scrollView = [[UIScrollView alloc] initWithFrame:scrollViewFrame];
	[self.view addSubview:self.scrollView];
    
	[self createSimplyfiedOrdenatedColorsArray];
    [self setupColorButtonsForInterfaceOrientation:self.interfaceOrientation];
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	[super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
	if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation))
	{
		self.contentSizeForViewInPopover = kPortraitContentSize;
	}
	else
	{
		self.contentSizeForViewInPopover = kLandscapeContentSize;
	}
	
	[UIView animateWithDuration:duration
					 animations:^{
						 CGRect scrollViewFrame = CGRectZero;
						 scrollViewFrame.size = self.contentSizeForViewInPopover;
						 self.scrollView.frame = scrollViewFrame;
                         
						 [self setupColorButtonsForInterfaceOrientation:toInterfaceOrientation];
					 }];
}

-(void) createSimplyfiedOrdenatedColorsArray{
    self.colorCollection = [NSArray arrayWithObjects:
                            
                            IndianRed,
                            LightCoral,
                            Red,
                            Crimson,
                            Firebrick,
                            DarkRed,
                            
                            Coral,
                            Tomato,
                            OrangeRed,
                            Orange,
                            Gold,
                            Yellow,
                            
                            Pink,
                            HotPink,
                            DeepPink,
                            Fuchsia,
                            Magenta,
                            Purple,
                            
                            SeaGreen,
                            ForestGreen,
                            Green,
                            DarkGreen,
                            OliveDrab,
                            Olive,
                            
                            DeepSkyBlue,
                            CornflowerBlue,
                            RoyalBlue,
                            Blue,
                            DarkBlue,
                            MidnightBlue,
                            
                            Goldenrod,
                            DarkGoldenrod,
                            Chocolate,
                            SaddleBrown,
                            Brown,
                            Maroon,
                            
                            White,
                            Snow,
                            Gainsboro,
                            LightGray,
                            Silver,
                            DarkGray,
                            
                            Gray,
                            DimGray,
                            LightSlateGray,
                            SlateGray,
                            DarkSlateGray,
                            Black, nil];
}


-(void)setupColorButtonsForInterfaceOrientation:(UIInterfaceOrientation)orientation{
	int iMax = 7;
	int jMax = 5;
	
	if (UIInterfaceOrientationIsLandscape(orientation))
	{
		int tmp = iMax;
		iMax = jMax;
		jMax = tmp;
	}
    
    self.scrollView.contentSize = CGSizeMake(jMax * 40, (iMax + 1) * 40);
    
	if (nil == self.colorButtons)
	{
		NSMutableArray* newColorButtons = [NSMutableArray arrayWithCapacity:iMax * jMax];
		int colorNumber = 0;
		for (int i=0; i<=iMax; i++) {
			for (int j=0; j<=jMax; j++) {
				
				ColorButton *colorButton = [ColorButton buttonWithType:UIButtonTypeCustom];
				colorButton.frame = CGRectMake(3+(j*40), 3+(i*40), 35, 35);
				[colorButton addTarget:self action:@selector(buttonPushed:) forControlEvents:UIControlEventTouchUpInside];
				
				[colorButton setSelected:NO];
				[colorButton setNeedsDisplay];
				[colorButton setBackgroundColor:[GzColors colorFromHex:[self.colorCollection objectAtIndex:colorNumber]]];
				colorButton.accessibilityLabel = [GzColors accessibilityLabelForColor:[self.colorCollection objectAtIndex:colorNumber]];
				[colorButton setHexColor:[self.colorCollection objectAtIndex:colorNumber]];
				
				colorButton.layer.cornerRadius = 4;
				colorButton.layer.masksToBounds = YES;
				colorButton.layer.borderColor = [UIColor blackColor].CGColor;
				colorButton.layer.borderWidth = 1.0f;
				
				colorButton.tag = colorNumber;
				
				CAGradientLayer *gradient = [CAGradientLayer layer];
				gradient.frame = colorButton.bounds;
				//               gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor blackColor] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
				gradient.colors = [NSArray arrayWithObjects:(id)[ [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.45] CGColor], (id)[[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1]  CGColor], nil];
				
				[colorButton.layer insertSublayer:gradient atIndex:0];
				
				colorNumber ++;
				
				[newColorButtons addObject:colorButton];
				
				[self.scrollView addSubview:colorButton];
			}
		}
		
		self.colorButtons = [newColorButtons copy];
	}
	else
	{
		for (UIButton* colorButton in self.colorButtons)
		{
			int colorNumber = colorButton.tag;
			
			int j = colorNumber % (jMax + 1);
			int i = colorNumber / (jMax + 1);
			
			colorButton.frame = CGRectMake(3+(j*40), 3+(i*40), 35, 35);
		}
	}
}


-(void) buttonPushed:(id)sender{
    ColorButton *btn = (ColorButton *)sender;
    [delegate colorPopoverControllerDidSelectColor:btn.hexColor];
}


@end
