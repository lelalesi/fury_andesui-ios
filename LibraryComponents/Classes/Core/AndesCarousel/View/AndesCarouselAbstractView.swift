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
    @IBOutlet weak var collectionView: UICollectionView!

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
        loadNib()

        translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
        containerView.pinToSuperview()
        containerView.clipsToBounds = true
        setupCollectionView()
        updateView()
    }

    private func setupCollectionView() {
        collectionView.backgroundColor = .blue
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = false
        registerCells(ids: [AndesCarouselViewCell.identifier])
        setupCollectionViewLayout()
    }

    private func setupCollectionViewLayout() {

        let cellXInset: CGFloat = 20

        let cellWidth: CGFloat = (collectionView.frame.width - 2 * cellXInset)
        let cellHeight: CGFloat = collectionView.frame.height

        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)

        layout.minimumLineSpacing = 12.0
        layout.scrollDirection = .horizontal

    }

    private func registerCells(ids: [String]) {
        for id in ids {
            collectionView.register(AndesCarouselViewCell.self, forCellWithReuseIdentifier: id)
        }
    }

    // MARK: - View configuration

    /// Override this method on Carousel View to setup its unique components
    func updateView() {
        #warning("Esto es ineficiente, actualizar solamente layout creo que con el `collectionView.collectionViewLayout.invalidateLayout()`")
//        collectionView.collectionViewLayout.invalidateLayout()
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
        return delegate?.numberOfItems() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AndesCarouselViewCell.identifier,
                                                            for: indexPath) as? AndesCarouselViewCell else {
            return UICollectionViewCell()
        }

        let itemView = delegate?.andesCarousel(cellForItemAt: indexPath) ?? UIView()

        cell.setView(view: itemView)

        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension AndesCarouselAbstractView: UICollectionViewDelegate, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.andesCarousel(didSelectItemAt: indexPath)
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        let cellWidthWithSpacing = layout.itemSize.width + layout.minimumLineSpacing

        var offset = targetContentOffset.pointee

        let index = (offset.x + scrollView.contentInset.left) / cellWidthWithSpacing
        let roundedIndex = round(index)

        offset = CGPoint(x: roundedIndex * cellWidthWithSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)

        targetContentOffset.pointee = offset
    }
}
