//
//  AndesCarouselViewCell.swift
//  AndesUI
//
//  Created by Javier Quiles on 13/08/2020.
//

import UIKit

class AndesCarouselViewCell: UICollectionViewCell {

    static var identifier: String {
        get {
            return String(describing: AndesCarouselViewCell.self)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        backgroundColor = .orange
    }

    public func setView(view: UIView) {
        addSubview(view)
        view.pinToSuperview()
    }

}
