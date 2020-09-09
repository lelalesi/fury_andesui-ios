//
//  AndesCarousel.swift
//  AndesUI
//
//  Created by Javier Quiles on 11/08/2020.
//

import UIKit

@objc public class AndesCarousel: UIView {

    var contentView: AndesCarouselView!
    weak var delegate: AndesCarouselViewDelegate?

    // MARK: - User properties

    /// Sets the internal views of the AndesCarousel
    @objc public var itemView = UIView() {
        didSet { self.updateContentView() }
    }

    /// Sets the padding of the AndesCarousel
    @objc public var padding: AndesCarouselPadding = .small {
        didSet { self.updateContentView() }
    }

    /// Sets the padding of the AndesCarousel
    @objc public var isCenter: Bool = true {
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

    @objc public init(itemView: UIView, padding: AndesCarouselPadding = .small, isCenter: Bool = true) {
        super.init(frame: .zero)
        self.itemView = itemView
        self.padding = padding
        self.isCenter = isCenter
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
        //contentView.delegate = self
        addSubview(contentView)
        contentView.pinToSuperview()
    }

    private func updateContentView() {
        let config = AndesCarouselViewConfigFactory.provideConfig(for: self)
        contentView.update(withConfig: config)
    }

}

// MARK: - IB Interface
public extension AndesCarousel {

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'padding' instead.")
    @IBInspectable var ibPadding: String {
        set(val) {
            self.padding = AndesCarouselPadding.checkValidEnum(property: "IB padding", key: val)
        }
        get {
            return self.padding.toString()
        }
    }

}
