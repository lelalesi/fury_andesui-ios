//
//  AndesCarouselViewConfig.swift
//  AndesUI
//
//  Created by Javier Quiles on 14/08/2020.
//

import Foundation

/// used to define the ui of internal AndesCarousel views

struct AndesCarouselViewConfig {
    let views: [UIView]

    init(views: [UIView]) {
        self.views = views
    }

    init() {
        self.views = []
    }
}
