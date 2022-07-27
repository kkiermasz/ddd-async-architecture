//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Combine
import UIKit

extension StackScreenPresenter {
    public func didShow(_ screen: Screen) -> AnyPublisher<Void, Never> {
        navigationController.didShow(screen.viewController)
    }
}
