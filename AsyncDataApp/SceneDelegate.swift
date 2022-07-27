//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import UIKit
import Utilities

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Properties

    var window: UIWindow?

    private var coordinator: Coordinator?

    // MARK: - UIWindowSceneDelegate

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let window = UIWindow(windowScene: windowScene)
        self.window = window

        coordinator = AppFlowCoordinator(in: window)
        coordinator?.start()
    }

}
