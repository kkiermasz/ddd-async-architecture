//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Combine
import UIKit

public final class DefaultStackScreenPresenter: StackScreenPresenter {

    // MARK: - Properties

    public let navigationController: NavigationController

    private var backClosures: [String: (() -> Void)] = [:]
    private var container = Set<AnyCancellable>()

    // MARK: - Initialization

    public init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - StackScreenPresenter

    public func push(_ screen: Screen, onBack: (() -> Void)?) {
        let key = screen.viewController.description
        backClosures[key] = onBack

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

    // MARK: - Private

    private func setup() {
        navigationController.didShow.sink { [navigationController, weak self] viewController in
            guard let fromViewController = navigationController.baseNavigationController.transitionCoordinator?.viewController(forKey: .from),
                !navigationController.baseNavigationController.viewControllers.contains(fromViewController) else {
                return
            }
            guard let closure = self?.backClosures.removeValue(forKey: fromViewController.description) else { return }
            closure()
        }
        .store(in: &container)
    }

}
