//
//  CarouselRouter.swift
//  AndesUI-demoapp
//
//  Created by Javier Quiles on 11/08/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Foundation

protocol CarouselRouter: NSObject {
    func route(from: UIViewController)
}

class CarouselAppRouter: NSObject {
    var view: AndesShowcasePageViewController!
}

extension CarouselAppRouter: CarouselRouter {
    func route(from: UIViewController) {
        view = AndesShowcasePageViewController(controllers: [CarouselViewController(), CarouselObjCViewController()])
        view.title = "AndesCarousel"
        from.navigationController?.pushViewController(view, animated: true)
    }
}
