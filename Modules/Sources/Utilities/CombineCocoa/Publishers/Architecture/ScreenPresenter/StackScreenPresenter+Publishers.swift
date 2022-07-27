// Created by Jakub Kiermasz on 21/01/2022.
// Copyright © 2022 SpotOn. All rights reserved.

import Combine
import UIKit

extension StackScreenPresenter {
    public func didShow(_ screen: Screen) -> AnyPublisher<Void, Never> {
        navigationController.didShow(screen.viewController)
    }
}
