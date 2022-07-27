//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

public protocol ScreenPresenter: AnyObject {
    var presented: ScreenPresenter? { get }

    func present(_ screen: Screen)
    func dismiss()
}
