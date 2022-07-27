// Created by Jakub Kiermasz on 21/01/2022.
// Copyright © 2022 SpotOn. All rights reserved.

import Combine
import UIKit

extension NavigationController {
    public func didShow(_ viewController: UIViewController) -> AnyPublisher<Void, Never> {
        baseNavigationController.didShow(viewController)
    }
}
