//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import SwiftUI
import Utilities

public final class AddMovieCharacterFlow: Coordinator {

    // MARK: - Properties

    private let navigationController: UINavigationController

    // MARK: - Initialization

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Flow

    public func start() {
        presentAddMovieCharacterScreen()
    }

    // MARK: - Private

    private func presentAddMovieCharacterScreen() {
        let router = DefaultAddMovieCharacterRouter()
        let model = DefaultAddMovieCharacterModel()
        let viewModel = AddMovieCharacterViewModel(router: router, model: model)
        let view = AddMovieCharacterView(viewModel: viewModel)

        navigationController.pushViewController(UIHostingController(rootView: view), animated: true)
    }

}
