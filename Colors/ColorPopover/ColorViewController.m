//
//  ColorViewController.m
//  Colors
//
//  Created by Gazolla on 01/09/12.
//  Copyright (c) 2012 Gazolla. All rights reserved.
//

#import "ColorViewController.h"

@interface ColorViewController ()

@end

@implementation ColorViewController

const CGSize kPortraitContentSize = { 240, 250 };
const CGSize kLandscapeContentSize = { 320, 170 };

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation))
		{
			self.contentSizeForViewInPopover = kPortraitContentSize;
		}
		else
		{
			self.contentSizeForViewInPopover = kLandscapeContentSize;
		}
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createSimplyfiedOrdenatedColorsArray];
    [self loadColorButtons];
	// Do any additional setup after loading the view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
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


-(void)loadColorButtons{
    int iMax = 7;
	int jMax = 5;
	
	if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation))
	{
		int tmp = iMax;
		iMax = jMax;
		jMax = tmp;
	}

    CGRect scrollViewFrame = CGRectZero;
	scrollViewFrame.size = self.contentSizeForViewInPopover;
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:scrollViewFrame];
    
    scroll.contentSize = CGSizeMake(jMax * 40, (iMax + 1) * 40);
    [self.view addSubview:scroll];

	if (self.buttonCollection != nil) {
		for (ColorButton *colorButton in self.buttonCollection) {
			[colorButton removeFromSuperview];
		}
		self.buttonCollection = nil;
	}
    
	self.buttonCollection = [[NSMutableArray alloc]initWithCapacity:iMax * jMax];
	
    dispatch_queue_t myQueue = dispatch_queue_create("com.gazapps.myqueue", 0);
    dispatch_async(myQueue, ^{
        int colorNumber = 0;
        for (int i=0; i<=iMax; i++) {
            for (int j=0; j<=jMax; j++) {
                
                ColorButton *colorButton = [ColorButton buttonWithType:UIButtonTypeCustom];
                colorButton.frame = CGRectMake(3+(j*40), 3+(i*40), 35, 35);
                [colorButton addTarget:self action:@selector(buttonPushed:) forControlEvents:UIControlEventTouchUpInside];
                
                [colorButton setSelected:NO];
                [colorButton setNeedsDisplay];
                [colorButton setBackgroundColor:[GzColors colorFromHex:[self.colorCollection objectAtIndex:colorNumber]]];
                [colorButton setHexColor:[self.colorCollection objectAtIndex:colorNumber]];
                
                colorButton.layer.cornerRadius = 4;
                colorButton.layer.masksToBounds = YES;
                colorButton.layer.borderColor = [UIColor blackColor].CGColor;
                colorButton.layer.borderWidth = 1.0f;
                
                CAGradientLayer *gradient = [CAGradientLayer layer];
                gradient.frame = colorButton.bounds;
                //               gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor blackColor] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
                gradient.colors = [NSArray arrayWithObjects:(id)[ [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.45] CGColor], (id)[[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1]  CGColor], nil];
                
                
                [colorButton.layer insertSublayer:gradient atIndex:0];
                
                
                colorNumber ++;
                
                
                dispatch_sync(dispatch_get_main_queue(), ^{
                    [self.buttonCollection addObject:colorButton];
                    [scroll addSubview:colorButton];
                });//end block
            }
        }
        
    });//end block
}


-(void) buttonPushed:(id)sender{    
    ColorButton *btn = (ColorButton *)sender;
    [delegate colorPopoverControllerDidSelectColor:btn.hexColor];
}


@end
