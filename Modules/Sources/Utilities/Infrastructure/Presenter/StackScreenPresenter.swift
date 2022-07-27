//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import UIKit

public protocol StackScreenPresenter: ScreenPresenter {
    var navigationController: NavigationController { get }

    func push(_ screen: Screen)
    func replace(with screen: Screen)

    func pop()
    func pop(to screen: Screen)
}
