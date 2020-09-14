//
//  AndesCarouselPaddingFactory.swift
//  AndesUI
//
//  Created by Javier Quiles on 08/09/2020.
//

import Foundation

class AndesCarouselPaddingFactory {
    static func provide(_ padding: AndesCarouselPadding) -> AndesCarouselPaddingProtocol {
        switch padding {
        case .none:
            return AndesCarouselPaddingNone()
        case .small:
            return AndesCarouselPaddingSmall()
        case .medium:
            return AndesCarouselPaddingMedium()
        case .large:
            return AndesCarouselPaddingLarge()
        }
    }
}
