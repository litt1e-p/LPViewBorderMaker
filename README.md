# LPViewBorderMaker

UIView extension of making UIView borders

# Install

###### `pod 'LPViewBorderMaker', '~> 1.0.0'`

# Usage

```swift
//make borders for edges with default border width and color
- (void)makeBorders;

//make border for a edge which can be top/left/bottom/right with custom border width and color 
- (void)makeBordersWithWidth:(float)width color:(UIColor *)color position:(LPBorderPosition)position;
//for example: make view borders with params:`LPBorderPositionBottom|LPBorderPositionRight|LPBorderPositionLeft`
UIView *v = [[UIView alloc] initWithFrame:CGRectMake(150, 170, 100, 70)];
[v makeBordersWithWidth:0.5 color:[UIColor redColor] position:LPBorderPositionBottom|LPBorderPositionRight|LPBorderPositionLeft];

//make borders for some edges with an array, you can custom border width and color too (DEPRECATED)
// - (void)makeBordersWithWidth:(float)width color:(UIColor *)color positions:(NSArray *)positions;
```

# Screenshot

<img src="screenshot.png", width=320>

# Release Notes

- 1.0.0

  modify function params type

- 0.0.2

  view layer bugfix
  
- 0.0.1

  first commit version
