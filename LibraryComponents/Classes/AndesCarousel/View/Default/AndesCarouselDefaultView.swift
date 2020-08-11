//
//  AndesCarouselDefaultView.swift
//  AndesUI
//
//  Created by Javier Quiles on 10/08/2020.
//

import UIKit

class AndesCarouselDefaultView: AndesCarouselAbstractView {
    override func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesCarouselDefaultView", owner: self, options: nil)
    }
}
