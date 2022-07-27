//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import UIKit

public final class DefaultScreenPresenter: ScreenPresenter {

    // MARK: - Properties

    private let viewController: UIViewController

    // MARK: - Initialization

    public init(viewController: UIViewController) {
        self.viewController = viewController
    }

    // MARK: - ScreenPresenter

    public var presented: ScreenPresenter? {
        guard let presentedViewController = viewController.presentedViewController else {
            return nil
        }

        return DefaultScreenPresenter(viewController: presentedViewController)
    }

    public func present(_ screen: Screen) {
        assert(viewController.presentedViewController == nil)
        viewController.present(screen.viewController, animated: true)
    }

    public func dismiss() {
        assert(viewController.presentedViewController != nil)
        viewController.dismiss(animated: true)
    }

}
