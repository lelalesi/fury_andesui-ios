//
//  AndesCarouselViewConfigFactory.swift
//  AndesUI
//
//  Created by Javier Quiles on 14/08/2020.
//

import Foundation

class AndesCarouselViewConfigFactory {
    static func provideConfig(for carousel: AndesCarousel) -> AndesCarouselViewConfig {
        let padding = AndesCarouselPaddingFactory.provide(carousel.padding)
        let isCenter = carousel.isCenter

        return AndesCarouselViewConfig(padding: padding.paddingSize, isCenter: isCenter)
    }
}
