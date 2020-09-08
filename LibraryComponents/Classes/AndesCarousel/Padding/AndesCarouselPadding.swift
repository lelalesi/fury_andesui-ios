//
//  AndesCarouselPadding.swift
//  AndesUI
//
//  Created by Javier Quiles on 08/09/2020.
//

import Foundation

/// Used to define the padding of an AndesCarousel
@objc public enum AndesCarouselPadding: Int, AndesEnumStringConvertible {
    case none
    case small
    case medium
    case large

    public static func keyFor(_ value: AndesCarouselPadding) -> String {
        switch value {
        case .none: return "NONE"
        case .small: return "SMALL"
        case .medium: return "MEDIUM"
        case .large: return "LARGE"
        }
    }
}
