//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import UIKit

public final class DefaultNavigationController: NavigationController {
    // MARK: - Properties

    private let navigationController: UINavigationController

    private let backButtonItemProducer: () -> UIBarButtonItem?

    // MARK: - Getters

    public var baseNavigationController: UINavigationController { navigationController }

    // MARK: - Initialization

    public init(navigationController: UINavigationController, backButtonItem: @escaping () -> UIBarButtonItem?) {
        self.navigationController = navigationController
        backButtonItemProducer = backButtonItem
    }

    // MARK: - NavigationController

    public func push(_ viewController: UIViewController) {
        viewController.navigationItem.backBarButtonItem = backButtonItemProducer()
        navigationController.pushViewController(viewController, animated: true)
    }

    public func replace(with viewController: UIViewController) {
        viewController.navigationItem.backBarButtonItem = backButtonItemProducer()

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
