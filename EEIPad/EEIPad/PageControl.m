#import "PageControl.h"



@implementation PageControl

@synthesize delegate;
@synthesize activePage = _activePage;
@synthesize inactivePage = _inactivePage;
@synthesize numberOfItems = _numberOfItems;
@synthesize itemsPerPage = _itemsPerPage;
@synthesize dotDiameter = _dotDiameter;
@synthesize dotSpacer = _dotSpacer;


- (NSInteger)currentPage {
    return _currentPage;
}

- (void)setCurrentPage:(NSInteger)page {
    _currentPage = MIN(MAX(0, page), _numberOfPages-1);
    [self setNeedsDisplay];
}

- (NSInteger)numberOfPages {
    return _numberOfPages;
}

- (int)calculatePage:(int)delta {
    return MIN(MAX(0, _currentPage + delta), _numberOfPages - 1);
}

-(int)firstActiveItem {
    return self.currentPage;
}

-(int)lastActiveItem {
    return self.currentPage + (self.itemsPerPage - 1);
}


- (void)setNumberOfItems:(NSInteger)pages {
    _numberOfItems = pages;
    _numberOfPages = MAX(1,_numberOfItems - _itemsPerPage + 1);
    _currentPage = [self calculatePage:0];
    [self setNeedsDisplay];
}

-(void)setItemsPerPage:(NSInteger)itemsPerPage {
    _itemsPerPage = MIN(itemsPerPage, _numberOfItems);
    self.numberOfItems = _numberOfItems;
}

- (void)setDefaults {
    self.dotDiameter = 10;
    self.dotSpacer = 10;

    self.activePage = [UIImage imageNamed:@"active_page_icon.png"];
    self.inactivePage = [UIImage imageNamed:@"page_icon.png"];
    self.backgroundColor = [UIColor clearColor];

    self.numberOfItems = 3;
    self.itemsPerPage = 1;
    self.currentPage = 0;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setDefaults];
    }

    return self;
}

- (float)calculateDotsWidth {
    return self.numberOfItems * self.dotDiameter + MAX(0, self.numberOfItems -1) * self.dotSpacer;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetAllowsAntialiasing(context, true);

    CGRect currentBounds = self.bounds;
    CGFloat dotsWidth = [self calculateDotsWidth];
    CGFloat x = CGRectGetMidX(currentBounds) - dotsWidth / 2;
    CGFloat y = CGRectGetMidY(currentBounds) - self.dotDiameter / 2;
    for (int i = 0; i < _numberOfItems; i++) {
        CGRect pageRect = CGRectMake(x, y, self.dotDiameter, self.dotDiameter);
        if (i >= _currentPage && i< _currentPage + _itemsPerPage) {
            [self.activePage drawInRect:pageRect];
        }
        else {
            [self.inactivePage drawInRect:pageRect];
        }
        x += self.dotDiameter + self.dotSpacer;
    }
}

- (void)dealloc {
    [_activePage release];
    [_inactivePage release];
    [super dealloc];
}

- (float)calculatePageSize {
    return (self.dotDiameter *(self.itemsPerPage) + (self.dotSpacer * (self.itemsPerPage -1)));
}

- (CGFloat)getCenterOfCurrentPage {
    CGFloat dotsWidth = [self calculateDotsWidth];
    CGFloat firstPageX = CGRectGetMidX(self.bounds) - dotsWidth / 2 + [self calculatePageSize] / 2;
    firstPageX += self.currentPage * (self.dotDiameter + self.dotSpacer);
    return firstPageX;
}

- (void)tryChangePage:(int)delta {
    int nextPage = [self calculatePage:delta];
    if (nextPage != self.currentPage) {
        self.currentPage = nextPage;
        if ([self.delegate respondsToSelector:@selector(pageControlPageDidChange:)]) {
            [self.delegate pageControlPageDidChange:self];
        }
    }

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    CGPoint touchPoint = [[[event touchesForView:self] anyObject] locationInView:self];

    CGFloat centerOfCurrentPage = [self getCenterOfCurrentPage];

    if (touchPoint.x < centerOfCurrentPage - [self calculatePageSize]/2) {
        [self tryChangePage:-1];
    }

    if (touchPoint.x > centerOfCurrentPage + [self calculatePageSize]/2) {
        [self tryChangePage:1];
    }

}

@end