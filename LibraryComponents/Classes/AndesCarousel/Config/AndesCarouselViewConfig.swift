//
//  AndesCarouselViewConfig.swift
//  AndesUI
//
//  Created by Javier Quiles on 14/08/2020.
//

import Foundation

/// used to define the ui of internal AndesCarousel views

struct AndesCarouselViewConfig {
    let padding: UInt
    let isCenter: Bool

    init(padding: UInt, isCenter: Bool) {
        self.padding = padding
        self.isCenter = isCenter
    }

    init() {
        self.padding = 12
        self.isCenter = true
    }
}
