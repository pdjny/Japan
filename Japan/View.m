//
//  View.m
//  Japan
//
//  Created by PHILIP JACOBS on 6/29/13.
//  Copyright (c) 2013 PHILIP JACOBS. All rights reserved.
//

#import "View.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor whiteColor];
		
		//Keep the size of the view the same,
		//but let the center of the view be the origin.
		//CGFloat w = self.bounds.size.width;
		//CGFloat h = self.bounds.size.height;
		//self.bounds = CGRectMake(-w / 2, -h / 2, w, h);
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
	NSLog(@"self.frame == (%g, %g), %g × %g",
		  self.frame.origin.x,
		  self.frame.origin.y,
		  self.frame.size.width,
		  self.frame.size.height
		  );
	
	NSLog(@"self.bounds == (%g, %g), %g × %g",
		  self.bounds.origin.x,
		  self.bounds.origin.y,
		  self.bounds.size.width,
		  self.bounds.size.height
		  );
	
	UIFont *font = [UIFont systemFontOfSize: 32];
	[@"Origin" drawAtPoint: CGPointZero withFont: font];
	
    // Drawing code
 	//CGRect bounds = self.bounds;
	CGFloat width = self.bounds.size.width;
	CGFloat height = self.bounds.size.height;
	CGFloat radius = .3 * width;
	CGFloat diameter = 2 * radius;
	
// 	CGRect r = CGRectMake(bounds.origin.x,bounds.origin.y, diameter, diameter);
 	
	// To center circle when origin is top left
	//CGRect r = CGRectMake((width / 2) - radius, ((height / 2) - radius), diameter, diameter);
	
	// To center circle when origin is center
	CGRect r = CGRectMake(-radius, -radius, diameter, diameter);
	
	CGContextRef c = UIGraphicsGetCurrentContext();
	
	//Put the origin at the center of the UIView.
	CGContextTranslateCTM(c, self.bounds.size.width / 2, self.bounds.size.height / 2);
	//Make the Y axis point up.
	CGContextScaleCTM(c, 1, -1);
	
	//CGAffineTransform ctm = CGContextGetCTM(c);
	//NSLog(@"%6g%6g%6g", ctm.a,  ctm.b,  0.0);
	//NSLog(@"%6g%6g%6g", ctm.c,  ctm.d,  0.0);
	//NSLog(@"%6g%6g%6g", ctm.tx, ctm.ty, 1.0);	//translate x, translate y
	
	//CGContextTranslateCTM(c, width / 2, height / 2);
	CGContextBeginPath(c);
	//CGContextAddRect(c, r);
	//CGContextFillRect(c, r);
	CGContextAddEllipseInRect(c, r);
	CGContextSetRGBFillColor(c, 1, 0, 0, 1);
	CGContextFillPath(c);
	
}


@end
