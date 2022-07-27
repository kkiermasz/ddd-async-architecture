// Created by Jakub Kiermasz on 21/01/2022.
// Copyright © 2022 SpotOn. All rights reserved.

import Combine
import UIKit

extension UINavigationController {
    // MARK: - Type Aliases

    public typealias ShowEvent = (viewController: UIViewController, animated: Bool)

    // MARK: - Getters

    private var delegateProxy: UINavigationControllerDelegateProxy { .createDelegateProxy(for: self) }

    private var didShow: AnyPublisher<ShowEvent, Error> {
        delegateProxy
            .methodInvoked(#selector(UINavigationControllerDelegate.navigationController(_:didShow:animated:)))
            .tryMap { argument in
                let viewController: UIViewController = try castOrThrow(argument[1])
                let animated: Bool = try castOrThrow(argument[2])
                return ShowEvent(viewController: viewController, animated: animated)
            }
            .eraseToAnyPublisher()
    }

    // MARK: - Public

    public func didShow(_ viewController: UIViewController) -> AnyPublisher<Void, Never> {
        didShow
            .map { showedViewController, _ in showedViewController === viewController }
            .replaceError(with: false)
            .filter { isCurrent in isCurrent }
            .map { _ in () }
            .eraseToAnyPublisher()
    }
}

private class UINavigationControllerDelegateProxy: DelegateProxy, UINavigationControllerDelegate, DelegateProxyType {
    func setDelegate(to object: UINavigationController) {
        object.delegate = self
    }
}
