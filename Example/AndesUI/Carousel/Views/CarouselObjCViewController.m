//
//  CarouselObjCViewController.m
//  AndesUI-demoapp
//
//  Created by Javier Quiles on 20/08/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

#import "CarouselObjCViewController.h"
#import <AndesUI-Swift.h>

@interface CarouselObjCViewController ()

@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@end

@implementation CarouselObjCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    __weak typeof(self) weakSelf = self;

    self.stackView.translatesAutoresizingMaskIntoConstraints = false;

    // Basic carousel
    AndesCarousel *carousel = [[AndesCarousel alloc] initWithItemView:[self buildView] padding:AndesCarouselPaddingSmall isCenter:true];

    [self.stackView addArrangedSubview:carousel];

}

- (UIView *)buildView {
    UIImageView *imageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"item-example" inBundle:nil compatibleWithTraitCollection:nil]];
    imageView.translatesAutoresizingMaskIntoConstraints = false;
    
    NSArray *constraints = @[
        [imageView.heightAnchor constraintEqualToConstant:80],
        [imageView.widthAnchor constraintEqualToConstant:80],
    ];
    [NSLayoutConstraint activateConstraints: constraints];
    
    imageView.layer.cornerRadius = 40;
    imageView.clipsToBounds = YES;
    
    UILabel *textLbl = [[UILabel alloc] init];
    textLbl.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
    textLbl.numberOfLines = 0;
    
    AndesFontStyle *font = [[AndesFontStyle alloc] initWithTextColor:AndesStyleSheetManager.styleSheet.textColorPrimary
                                                                 font:[AndesStyleSheetManager.styleSheet regularSystemFontWithSize:16]
                                                          lineSpacing:1];
    [textLbl setAndesStyleWithStyle:font];
    
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[imageView, textLbl]];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.spacing = 30;
    
    return stackView;
}

@end
