//
//  AndesCarouselAbstractView.swift
//  AndesUI
//
//  Created by Javier Quiles on 10/08/2020.
//

import Foundation

class AndesCarouselAbstractView: UIView {

    // MARK: - Xib Outlets

    @IBOutlet var containerView: UIView!
    @IBOutlet var collectionView: UICollectionView!

    // MARK: - View initialization

    private let views: [UIView]

    init(views: [UIView]) {
        self.views = views
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        self.views = []
        super.init(coder: coder)
        setup()
    }

    func loadNib() {
        fatalError("This should be override by a subclass")
    }

    private func setup() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }

}

// MARK: - UICollectionViewDataSource

extension AndesCarouselAbstractView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return views.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view = views[indexPath.row]
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate

extension AndesCarouselAbstractView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}
