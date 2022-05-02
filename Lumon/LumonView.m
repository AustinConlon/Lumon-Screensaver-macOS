//
//  LumonView.m
//  Lumon
//
//  Created by Austin Conlon on 4/22/22.
//

#import "LumonView.h"

@implementation LumonView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
        _rect = NSMakeRect(0, 0, 516 / 2, 266 / 2);
        _rectMovement = NSMakePoint(4, 4);
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    
    // Logo collides with right edge of screen.
    if (_rect.origin.x > rect.size.width - _rect.size.width)
        _rectMovement.x = -_rectMovement.x;
    // Logo collides with left edge of screen.
    if (_rect.origin.x < rect.origin.x)
        _rectMovement.x = -_rectMovement.x;
    // Logo collides with top edge of screen.
    if (_rect.origin.y > rect.size.height - _rect.size.height)
        _rectMovement.y = -_rectMovement.y;
    // Logo collides with bottom edge of screen.
    if (_rect.origin.y < rect.origin.y)
        _rectMovement.y = -_rectMovement.y;
    
    _rect.origin.x += _rectMovement.x;
    _rect.origin.y += _rectMovement.y;
    
    NSBundle *saverBundle = [NSBundle bundleForClass:[self class]];
    NSImage *image = [[NSImage alloc] initWithContentsOfFile:[saverBundle pathForResource:@"logo" ofType:@"png"]];
    [image drawInRect:_rect];

}

- (void)animateOneFrame
{
    [self setNeedsDisplay:YES];
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
