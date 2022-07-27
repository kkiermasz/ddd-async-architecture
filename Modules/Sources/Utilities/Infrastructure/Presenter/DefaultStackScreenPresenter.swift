//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import UIKit

public final class DefaultStackScreenPresenter: StackScreenPresenter {

    // MARK: - Properties

    public let navigationController: NavigationController

    // MARK: - Initialization

    public init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - StackScreenPresenter

    public func push(_ screen: Screen) {
        navigationController.push(screen.viewController)
    }

    public func replace(with screen: Screen) {
        navigationController.replace(with: screen.viewController)
    }

    public func pop() {
        navigationController.pop()
    }

    public func pop(to screen: Screen) {
        navigationController.pop(to: screen.viewController)
    }

    // MARK: - ScreenPresenter

    public var presented: ScreenPresenter? {
        guard let viewController = navigationController.baseNavigationController.presentedViewController else {
            return nil
        }

        return DefaultScreenPresenter(viewController: viewController)
    }

    public func present(_ screen: Screen) {
        navigationController.present(screen.viewController)
    }

    public func dismiss() {
        navigationController.baseNavigationController.presentedViewController?.dismiss(animated: true)
    }
}
