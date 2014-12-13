//
//  FOODitStyleKit.m
//  FOODit
//
//  Created by Marc Humet on 13/12/14.
//  Copyright (c) 2014 EQUUS LIFE SL. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

#import "FOODitStyleKit.h"


@implementation FOODitStyleKit

#pragma mark Cache

static UIColor* _characoal = nil;
static UIColor* _chicken = nil;
static UIColor* _seafood = nil;

#pragma mark Initialization

+ (void)initialize
{
    // Colors Initialization
    _characoal = [UIColor colorWithRed: 0.257 green: 0.257 blue: 0.253 alpha: 1];
    _chicken = [UIColor colorWithRed: 0.436 green: 0.906 blue: 0.484 alpha: 1];
    _seafood = [UIColor colorWithRed: 0.812 green: 0.812 blue: 0.812 alpha: 1];

}

#pragma mark Colors

+ (UIColor*)characoal { return _characoal; }
+ (UIColor*)chicken { return _chicken; }
+ (UIColor*)seafood { return _seafood; }

#pragma mark Drawing Methods

+ (void)drawExpandbutton
{
    //// Color Declarations
    UIColor* color1 = [UIColor colorWithRed: 0.956 green: 0.956 blue: 0.956 alpha: 1];
    UIColor* color0 = [UIColor colorWithRed: 0.892 green: 0.892 blue: 0.892 alpha: 1];
    UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Page-1
    {
        //// frontend-skills-test--1
        {
            //// image_card
            {
                //// expand
                {
                    //// Rectangle-17 Drawing
                    UIBezierPath* rectangle17Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0, 33, 12) cornerRadius: 2];
                    [color1 setFill];
                    [rectangle17Path fill];
                    [color0 setStroke];
                    rectangle17Path.lineWidth = 1;
                    [rectangle17Path stroke];


                    //// Oval-13 Drawing
                    UIBezierPath* oval13Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(4, 3, 6, 6)];
                    [color2 setFill];
                    [oval13Path fill];
                    [color0 setStroke];
                    oval13Path.lineWidth = 1;
                    [oval13Path stroke];


                    //// Oval-14 Drawing
                    UIBezierPath* oval14Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(13, 3, 6, 6)];
                    [color2 setFill];
                    [oval14Path fill];
                    [color0 setStroke];
                    oval14Path.lineWidth = 1;
                    [oval14Path stroke];


                    //// Oval-15 Drawing
                    UIBezierPath* oval15Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(22, 3, 6, 6)];
                    [color2 setFill];
                    [oval15Path fill];
                    [color0 setStroke];
                    oval15Path.lineWidth = 1;
                    [oval15Path stroke];
                }
            }
        }
    }
}

+ (void)drawMealcard__curve
{

    //// Page-1
    {
        //// meal-card__curve
        {
            //// topPath Drawing
            UIBezierPath* topPathPath = UIBezierPath.bezierPath;
            [topPathPath moveToPoint: CGPointMake(-0.03, 6.52)];
            [topPathPath addCurveToPoint: CGPointMake(143.78, 0) controlPoint1: CGPointMake(39.68, 2.4) controlPoint2: CGPointMake(92.42, 0)];
            [topPathPath addCurveToPoint: CGPointMake(282.59, 6.52) controlPoint1: CGPointMake(195.14, 0) controlPoint2: CGPointMake(242.88, 2.4)];
            [topPathPath addLineToPoint: CGPointMake(284, 6.52)];
            [topPathPath addLineToPoint: CGPointMake(284, 16.95)];
            [topPathPath addLineToPoint: CGPointMake(4, 16.95)];
            [topPathPath addLineToPoint: CGPointMake(4, 6.57)];
            [topPathPath addLineToPoint: CGPointMake(-0.03, 6.52)];
            [topPathPath closePath];
            topPathPath.miterLimit = 4;

            topPathPath.usesEvenOddFillRule = YES;

            [UIColor.whiteColor setFill];
            [topPathPath fill];


            //// path- Drawing
            UIBezierPath* pathPath = UIBezierPath.bezierPath;
            [pathPath moveToPoint: CGPointMake(-2.03, 19.24)];
            [pathPath addCurveToPoint: CGPointMake(141.78, 0) controlPoint1: CGPointMake(37.68, 7.09) controlPoint2: CGPointMake(90.42, 0)];
            [pathPath addCurveToPoint: CGPointMake(280.59, 19.24) controlPoint1: CGPointMake(193.14, 0) controlPoint2: CGPointMake(240.88, 7.09)];
            [pathPath addLineToPoint: CGPointMake(282, 19.24)];
            [pathPath addLineToPoint: CGPointMake(282, 50)];
            [pathPath addLineToPoint: CGPointMake(2, 50)];
            [pathPath addLineToPoint: CGPointMake(2, 19.39)];
            [pathPath addLineToPoint: CGPointMake(-2.03, 19.24)];
            [pathPath closePath];
            pathPath.miterLimit = 4;

            pathPath.usesEvenOddFillRule = YES;

            [UIColor.whiteColor setFill];
            [pathPath fill];


            //// bottomPath Drawing
            UIBezierPath* bottomPathPath = UIBezierPath.bezierPath;
            [bottomPathPath moveToPoint: CGPointMake(-2.03, 49.52)];
            [bottomPathPath addCurveToPoint: CGPointMake(143, 35) controlPoint1: CGPointMake(37.68, 45.4) controlPoint2: CGPointMake(91.64, 35)];
            [bottomPathPath addCurveToPoint: CGPointMake(280.59, 49.52) controlPoint1: CGPointMake(194.36, 35) controlPoint2: CGPointMake(240.88, 45.4)];
            [bottomPathPath addLineToPoint: CGPointMake(282, 49.52)];
            [bottomPathPath addLineToPoint: CGPointMake(282, 59.95)];
            [bottomPathPath addLineToPoint: CGPointMake(2, 59.95)];
            [bottomPathPath addLineToPoint: CGPointMake(2, 49.57)];
            [bottomPathPath addLineToPoint: CGPointMake(-2.03, 49.52)];
            [bottomPathPath closePath];
            bottomPathPath.miterLimit = 4;

            bottomPathPath.usesEvenOddFillRule = YES;

            [UIColor.whiteColor setFill];
            [bottomPathPath fill];
        }
    }
}

+ (void)drawTagcharcoal
{
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Page-1
    {
        //// tags
        {
            //// tag--charcoal Drawing
            UIBezierPath* tagcharcoalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 20.62, 20.6)];
            [FOODitStyleKit.characoal setFill];
            [tagcharcoalPath fill];
            [color2 setStroke];
            tagcharcoalPath.lineWidth = 2.41;
            [tagcharcoalPath stroke];
        }
    }
}

+ (void)drawTagcheese
{
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* color4 = [UIColor colorWithRed: 0.927 green: 0.93 blue: 0.807 alpha: 1];

    //// Page-1
    {
        //// tags
        {
            //// tag--cheese Drawing
            UIBezierPath* tagcheesePath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 20.62, 20.6)];
            [color4 setFill];
            [tagcheesePath fill];
            [color2 setStroke];
            tagcheesePath.lineWidth = 2.41;
            [tagcheesePath stroke];
        }
    }
}

+ (void)drawTagchicken
{
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// Page-1
    {
        //// tags
        {
            //// tag--chicken Drawing
            UIBezierPath* tagchickenPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 20.62, 20.6)];
            [FOODitStyleKit.chicken setFill];
            [tagchickenPath fill];
            [color2 setStroke];
            tagchickenPath.lineWidth = 2.41;
            [tagchickenPath stroke];
        }
    }
}

+ (void)drawTaggrilled
{
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* color6 = [UIColor colorWithRed: 0.848 green: 0.207 blue: 0.234 alpha: 1];

    //// Page-1
    {
        //// tags
        {
            //// tag--grilled Drawing
            UIBezierPath* taggrilledPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 20.62, 20.6)];
            [color6 setFill];
            [taggrilledPath fill];
            [color2 setStroke];
            taggrilledPath.lineWidth = 2.41;
            [taggrilledPath stroke];
        }
    }
}

+ (void)drawTaghighprotein
{
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* color7 = [UIColor colorWithRed: 0.413 green: 0.347 blue: 0.349 alpha: 1];

    //// Page-1
    {
        //// tags
        {
            //// tag--high-protein Drawing
            UIBezierPath* taghighproteinPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, -0.07, 20.62, 20.6)];
            [color7 setFill];
            [taghighproteinPath fill];
            [color2 setStroke];
            taghighproteinPath.lineWidth = 2.41;
            [taghighproteinPath stroke];
        }
    }
}

+ (void)drawTaglamb
{
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* color8 = [UIColor colorWithRed: 0.295 green: 0.403 blue: 0.642 alpha: 1];

    //// Page-1
    {
        //// tags
        {
            //// tag--lamb Drawing
            UIBezierPath* taglambPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 20.62, 20.6)];
            [color8 setFill];
            [taglambPath fill];
            [color2 setStroke];
            taglambPath.lineWidth = 2.41;
            [taglambPath stroke];
        }
    }
}

+ (void)drawTagpasta
{
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* color9 = [UIColor colorWithRed: 0.835 green: 0.822 blue: 0.634 alpha: 1];

    //// Page-1
    {
        //// tags
        {
            //// tag--pasta Drawing
            UIBezierPath* tagpastaPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 20.62, 20.6)];
            [color9 setFill];
            [tagpastaPath fill];
            [color2 setStroke];
            tagpastaPath.lineWidth = 2.41;
            [tagpastaPath stroke];
        }
    }
}

+ (void)drawTagpeanut
{
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* color10 = [UIColor colorWithRed: 0.525 green: 0.484 blue: 0.275 alpha: 1];

    //// Page-1
    {
        //// tags
        {
            //// tag--peanut Drawing
            UIBezierPath* tagpeanutPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 20.62, 20.6)];
            [color10 setFill];
            [tagpeanutPath fill];
            [color2 setStroke];
            tagpeanutPath.lineWidth = 2.41;
            [tagpeanutPath stroke];
        }
    }
}

+ (void)drawTagpork
{
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* color11 = [UIColor colorWithRed: 0.991 green: 0.575 blue: 0.586 alpha: 1];

    //// Page-1
    {
        //// tags
        {
            //// tag--pork Drawing
            UIBezierPath* tagporkPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, -0.07, 20.62, 20.6)];
            [color11 setFill];
            [tagporkPath fill];
            [color2 setStroke];
            tagporkPath.lineWidth = 2.41;
            [tagporkPath stroke];
        }
    }
}

+ (void)drawTagsnack
{
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* color13 = [UIColor colorWithRed: 0.917 green: 0.482 blue: 0.945 alpha: 1];

    //// Page-1
    {
        //// tags
        {
            //// tag--snack Drawing
            UIBezierPath* tagsnackPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, -0.07, 20.62, 20.6)];
            [color13 setFill];
            [tagsnackPath fill];
            [color2 setStroke];
            tagsnackPath.lineWidth = 2.41;
            [tagsnackPath stroke];
        }
    }
}

+ (void)drawTagspicy
{
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* color14 = [UIColor colorWithRed: 0.986 green: 0.088 blue: 0.152 alpha: 1];

    //// Page-1
    {
        //// tags
        {
            //// tag--spicy Drawing
            UIBezierPath* tagspicyPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 20.62, 20.6)];
            [color14 setFill];
            [tagspicyPath fill];
            [color2 setStroke];
            tagspicyPath.lineWidth = 2.41;
            [tagspicyPath stroke];
        }
    }
}

+ (void)drawTagstarter
{
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* color15 = [UIColor colorWithRed: 0.535 green: 0.599 blue: 0.94 alpha: 1];

    //// Page-1
    {
        //// tags
        {
            //// tag--starter Drawing
            UIBezierPath* tagstarterPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, -0.07, 20.62, 20.6)];
            [color15 setFill];
            [tagstarterPath fill];
            [color2 setStroke];
            tagstarterPath.lineWidth = 2.41;
            [tagstarterPath stroke];
        }
    }
}

+ (void)drawTagsweet
{
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* color16 = [UIColor colorWithRed: 0.87 green: 0.726 blue: 0.292 alpha: 1];

    //// Page-1
    {
        //// tags
        {
            //// tag--sweet Drawing
            UIBezierPath* tagsweetPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, -0.07, 20.62, 20.6)];
            [color16 setFill];
            [tagsweetPath fill];
            [color2 setStroke];
            tagsweetPath.lineWidth = 2.41;
            [tagsweetPath stroke];
        }
    }
}

+ (void)drawTagvegetarian
{
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* color17 = [UIColor colorWithRed: 0.228 green: 0.869 blue: 0.127 alpha: 1];

    //// Page-1
    {
        //// tags
        {
            //// tag--vegetarian Drawing
            UIBezierPath* tagvegetarianPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, -0.07, 20.62, 20.6)];
            [color17 setFill];
            [tagvegetarianPath fill];
            [color2 setStroke];
            tagvegetarianPath.lineWidth = 2.41;
            [tagvegetarianPath stroke];
        }
    }
}

+ (void)drawGenerictag
{
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

    //// tag--seafood 2 Drawing
    UIBezierPath* tagseafood2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 20.62, 20.6)];
    [color2 setStroke];
    tagseafood2Path.lineWidth = 2.41;
    [tagseafood2Path stroke];
}

+ (void)drawTagseafood
{
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* color3 = [UIColor colorWithRed: 0.812 green: 0.812 blue: 0.812 alpha: 1];

    //// Page-1
    {
        //// tags
        {
            //// tag--seafood Drawing
            UIBezierPath* tagseafoodPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 20.62, 20.6)];
            [color3 setFill];
            [tagseafoodPath fill];
            [color2 setStroke];
            tagseafoodPath.lineWidth = 2.41;
            [tagseafoodPath stroke];
        }
    }
}

@end
