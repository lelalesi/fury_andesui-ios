//
//  AndesCarouselViewCell.swift
//  AndesUI
//
//  Created by Javier Quiles on 13/08/2020.
//

import UIKit

class AndesCarouselViewCell: UICollectionViewCell {

    private var containerView = UIView()

    static var identifier: String {
        get {
            return String(describing: AndesCarouselViewCell.self)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func setView(view: UIView) {
        if view.isDescendant(of: self) { view.removeFromSuperview() }
        addSubview(view)
        view.pinToSuperview()

//        containerView.removeFromSuperview()
//        containerView = view
//        addSubview(containerView)
//        containerView.pinToSuperview()
    }

}
