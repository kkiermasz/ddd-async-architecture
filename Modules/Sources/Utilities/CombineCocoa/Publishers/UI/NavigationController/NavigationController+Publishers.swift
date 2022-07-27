//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Combine
import UIKit

extension NavigationController {
    public var didShow: AnyPublisher<UIViewController, Never> {
        baseNavigationController.didShow
    }

    public func didShow(_ viewController: UIViewController) -> AnyPublisher<Void, Never> {
        baseNavigationController.didShow(viewController)
    }
}
