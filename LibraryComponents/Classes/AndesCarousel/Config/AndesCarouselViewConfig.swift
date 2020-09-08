//
//  AndesCarouselViewConfig.swift
//  AndesUI
//
//  Created by Javier Quiles on 14/08/2020.
//

import Foundation

/// used to define the ui of internal AndesCarousel views

struct AndesCarouselViewConfig {
    let itemView: UIView

    init(itemView: UIView) {
        self.itemView = itemView
    }

    init() {
        self.itemView = UIView()
    }
}
