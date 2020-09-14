//
//  AndesCarouselView.swift
//  AndesUI
//
//  Created by Javier Quiles on 10/08/2020.
//

import Foundation

/**
 Internal protocol specifying the behaviour required by views to be a valid AndesCarousel representation
 */

protocol AndesCarouselView: UIView {
    var delegate: AndesCarouselViewDelegate? { get set }
    func update(withConfig config: AndesCarouselViewConfig)
}
