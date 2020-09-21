//
//  AndesCarouselViewCell.swift
//  AndesUI
//
//  Created by Javier Quiles on 13/08/2020.
//

import UIKit

//class myView: UIView {
//
//    let image = UIImageView()
//
//    override init(frame: CGRect) {
//        self.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(image)
//        image.pinToSuperview()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setState(viewState: String) {
//
//    }
//
//    func getState() -> String {
//        return
//    }
//}

class AndesCarouselViewCell: UICollectionViewCell {

//    var type: AndesCarouselViewCell.Type
    var containerView = UIView()

    static var identifier: String {
        get {
            return String(describing: AndesCarouselViewCell.self)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func setView(view: UIView) {
        self.backgroundColor = .red
        if self.contentView.subviews.isEmpty {
            contentView.addSubview(view)
            view.pinToSuperview()
        } else {
            let rehusedView = self.contentView.subviews.first
//            rehusedView.setState(view.getState)
        }

//        if view.isDescendant(of: self) { view.removeFromSuperview() }
//        addSubview(view)
//        view.pinToSuperview()

//        containerView.removeFromSuperview()
//        containerView = view
//        addSubview(containerView)
//        containerView.pinToSuperview()
    }

}
