//
//  Common.h
//  CoolTable
//
//  Created by Ray Wenderlich on 9/29/10.
//  Copyright 2010 Ray Wenderlich. All rights reserved.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <Foundation/Foundation.h>

#define kHighlightTop 0
#define kHighlightBottom 1

//void logRect(NSString *prefix, CGRect rect);
void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef  endColor);
//CGRect rectFor1PxStroke(CGRect rect);
//void draw1PxStroke(CGContextRef context, CGPoint startPoint, CGPoint endPoint, CGColorRef color);
//void drawHighlightAndGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor, BOOL reverse);
void drawLinearGloss(CGContextRef context, CGRect rect, BOOL reverse);
void drawCurvedGloss(CGContextRef context, CGRect rect, CGFloat radius);
//static inline double radians (double degrees) { return degrees * M_PI/180; }
//CGMutablePathRef createArcPathFromBottomOfRect(CGRect rect, CGFloat arcHeight);
CGMutablePathRef createRoundedRectForRect(CGRect rect, CGFloat radius);
CGMutablePathRef createRoundedRectForRectCCW(CGRect rect, CGFloat radius);
NSNumberFormatter *standardNumberFormatter();