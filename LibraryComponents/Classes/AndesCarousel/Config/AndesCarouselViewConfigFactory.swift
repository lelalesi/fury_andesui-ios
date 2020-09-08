//
//  AndesCarouselViewConfigFactory.swift
//  AndesUI
//
//  Created by Javier Quiles on 14/08/2020.
//

import Foundation

class AndesCarouselViewConfigFactory {
    static func provideConfig(for carousel: AndesCarousel) -> AndesCarouselViewConfig {
        let itemView = carousel.itemView
        return AndesCarouselViewConfig(itemView: itemView)
    }
}
