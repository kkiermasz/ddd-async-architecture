//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import UIKit

public protocol Screen: AnyObject {
    // MARK: - Properties

    var viewController: UIViewController { get }
}
