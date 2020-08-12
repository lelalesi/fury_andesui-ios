//
//  AndesCarouselViewDelegate.swift
//  AndesUI
//
//  Created by Javier Quiles on 11/08/2020.
//

import Foundation

protocol AndesCarouselViewDelegate: AnyObject {
    func andesCarousel(_ carousel: AndesCarousel, didSelectView: UIView)
}
