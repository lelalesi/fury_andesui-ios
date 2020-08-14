//
//  AndesCarouselViewCell.swift
//  AndesUI
//
//  Created by Javier Quiles on 13/08/2020.
//

import UIKit

class AndesCarouselViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!

    static var identifier: String {
        get {
            return String(describing: AndesCarouselViewCell.self)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
