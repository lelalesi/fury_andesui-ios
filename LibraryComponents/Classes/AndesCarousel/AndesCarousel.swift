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

    /// Sets the internal views of the AndesCarousel
    public var views: [UIView] = [] {
        didSet { self.updateContentView() }
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
        let config = AndesCarouselViewConfigFactory.provideConfig(for: self)
        return AndesCarouselDefaultView(withConfig: config)
    }

    private func drawContentView(with newView: AndesCarouselView) {
        contentView = newView
        contentView.delegate = self
        addSubview(contentView)
        contentView.pinToSuperview()
    }

    private func updateContentView() {
        let config = AndesCarouselViewConfigFactory.provideConfig(for: self)
        contentView.update(withConfig: config)
    }

}

// MARK: - AndesCarouselViewDelegate
extension AndesCarousel: AndesCarouselViewDelegate {
    func andesCarousel(didSelectView: UIView) {

    }
}
