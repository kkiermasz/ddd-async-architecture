//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import UIKit

public protocol NavigationController: AnyObject {
    var baseNavigationController: UINavigationController { get }

    func push(_ viewController: UIViewController)
    func replace(with viewController: UIViewController)
    func present(_ viewController: UIViewController)
    func pop()
    func pop(to viewController: UIViewController)
}
