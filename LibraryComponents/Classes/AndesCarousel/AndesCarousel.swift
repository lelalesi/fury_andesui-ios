//
//  AndesCarousel.swift
//  AndesUI
//
//  Created by Javier Quiles on 11/08/2020.
//

import UIKit

@objc public class AndesCarousel: UIView {

    var contentView: AndesCarouselView!

    // MARK: - User properties

    /// Sets the internal card view of the AndesCard
    public var views: [UIView] = [] {
        didSet { self.updateContentView() }
    }

    private func updateContentView() {
        //let config = AndesCardViewConfigFactory.provideConfig(for: self)
        //contentView.update(withConfig: config)
    }

    // MARK: - Initialization
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc public init(views: [UIView]) {
        super.init(frame: .zero)
        self.views = views
        setup()
    }

    // MARK: - Content View Setup

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        drawContentView(with: provideView())
    }

    /// Should return a view depending on which carousel variant is selected
    private func provideView() -> AndesCarouselView {
        //let config = AndesCardViewConfigFactory.provideConfig(for: self)

        return AndesCarouselDefaultView(views: [])
    }

    private func drawContentView(with newView: AndesCarouselView) {
        self.contentView = newView
        contentView.delegate = self
        addSubview(contentView)
        contentView.pinToSuperview()
    }

}

// MARK: - AndesCarouselViewDelegate
extension AndesCarousel: AndesCarouselViewDelegate {
    func andesCarousel(_ carousel: AndesCarousel, didSelectView: UIView) {

    }
}
