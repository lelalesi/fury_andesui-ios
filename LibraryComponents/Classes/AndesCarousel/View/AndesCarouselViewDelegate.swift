//
//  AndesCarouselViewDelegate.swift
//  AndesUI
//
//  Created by Javier Quiles on 11/08/2020.
//

import Foundation

@objc public protocol AndesCarouselViewDelegate: AnyObject {
    @objc func andesCarousel(cellForItemAt indexPath: IndexPath) -> UIView
    @objc func andesCarousel(didSelectItemAt indexPath: IndexPath)
}
