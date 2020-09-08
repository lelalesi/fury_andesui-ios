//
//  AndesCarouselAbstractView.swift
//  AndesUI
//
//  Created by Javier Quiles on 10/08/2020.
//

import Foundation

class AndesCarouselAbstractView: UIView, AndesCarouselView {

    weak var delegate: AndesCarouselViewDelegate?

    // MARK: - Xib Outlets

    @IBOutlet var containerView: UIView!
    @IBOutlet var collectionView: UICollectionView!

    // MARK: - View initialization

    var config: AndesCarouselViewConfig

    init(withConfig config: AndesCarouselViewConfig) {
        self.config = config
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        self.config = AndesCarouselViewConfig()
        super.init(coder: coder)
        setup()
    }

    func loadNib() {
        fatalError("This should be override by a subclass")
    }

    private func setup() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: AndesCarouselViewCell.identifier, bundle: AndesBundle.bundle())
        collectionView.register(nib, forCellWithReuseIdentifier: AndesCarouselViewCell.identifier)
    }

    // MARK: - View configuration

    /// Override this method on Carousel View to setup its unique components
    func updateView() {
        collectionView.reloadData()
    }

    func update(withConfig config: AndesCarouselViewConfig) {
        self.config = config
        updateView()
    }

}

// MARK: - UICollectionViewDataSource

extension AndesCarouselAbstractView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AndesCarouselViewCell.identifier,
                                                            for: indexPath) as? AndesCarouselViewCell else {
            return UICollectionViewCell()
        }

        cell.containerView = delegate?.andesCarousel(cellForItemAt: indexPath)

        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension AndesCarouselAbstractView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.andesCarousel(didSelectItemAt: indexPath)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AndesCarouselAbstractView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 288.0)
    }
}
