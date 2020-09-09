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
    let padding: UInt
    let isCenter: Bool

    init(itemView: UIView, padding: UInt, isCenter: Bool) {
        self.itemView = itemView
        self.padding = padding
        self.isCenter = isCenter
    }

    init() {
        self.itemView = UIView()
        self.padding = 12
        self.isCenter = true
    }
}
