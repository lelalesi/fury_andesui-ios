//
//  AndesCarouselAbstractView.swift
//  AndesUI
//
//  Created by Javier Quiles on 10/08/2020.
//

import Foundation

class AndesCarouselAbstractView: UIView, AndesCarouselView {

    // MARK: - Xib Outlets

    @IBOutlet var containerView: UIView!
    @IBOutlet var collectionView: UIColl!

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func loadNib() {
        fatalError("This should be override by a subclass")
    }

    private func setup() {

    }

}
