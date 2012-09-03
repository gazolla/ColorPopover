#ColorPopover

A ColorPopover is a very simple component for iPhone/iPad that provides a "Popover" color picker.

![](https://github.com/gazolla/ColorPopover/raw/master/screenshot.PNG)


##Supported Platforms

- iOS 5+

##Installing

In order to install `ColorPopover`, you'll need to copy the ColorPopover folder into your Xcode project. 

###Usage

In order to use `ColorPopover`, you'll need to include the following code in your project:

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


You will want to implement the method `colorPopoverControllerDidSelectColor:(NSString *)hexColor` from `ColorViewControllerDelegate` to get the result color selected. To use the color selected you should call the ` colorFromHex:(NSString *)hexColor` as the follow example:

	self.view.backgroundColor = [GzColors colorFromHex:hexColor];


 
##Credits & Contributors

`ColorPopover` was written by [Sebastian Gazolla Jr][1].

  [1]: http://gazapps.com

  
ColorPopover based on WEPopover Created by Werner Altewischer:

- [Werner Altewischer](https://github.com/werner77/WEPopover)

  
##License

`ColorPopover` is licensed under the MIT license, which is reproduced in its entirety here:


>Copyright (c) 2012 Sebastian Gazolla Jr
>
>Permission is hereby granted, free of charge, to any person obtaining a copy
>of this software and associated documentation files (the "Software"), to deal
>in the Software without restriction, including without limitation the rights
>to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>copies of the Software, and to permit persons to whom the Software is
>furnished to do so, subject to the following conditions:
>
>The above copyright notice and this permission notice shall be included in
>all copies or substantial portions of the Software.
>
>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
>AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>THE SOFTWARE.