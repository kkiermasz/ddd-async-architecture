//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import UIKit

public final class DefaultNavigationController: NavigationController {
    // MARK: - Properties

    private let navigationController: UINavigationController

    // MARK: - Getters

    public var baseNavigationController: UINavigationController { navigationController }

    // MARK: - Initialization

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - NavigationController

    public func push(_ viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }

    public func replace(with viewController: UIViewController) {
        let animated = navigationController.viewControllers.isEmpty == false
        navigationController.setViewControllers([viewController], animated: animated)
    }

    public func present(_ viewController: UIViewController) {
        navigationController.present(viewController, animated: true)
    }

    public func pop() {
        navigationController.popViewController(animated: true)
    }

    public func pop(to viewController: UIViewController) {
        navigationController.popToViewController(viewController, animated: true)
    }
}
