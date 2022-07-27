//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import SwiftUI
import Utilities

final class AddMovieCharacterScreen: Screen {

    // MARK: - Properties

    let viewController: UIViewController
    let router: AddMovieCharacterRouter

    // MARK: - Initialization

    init() {
        let router = DefaultAddMovieCharacterRouter()
        let model = DefaultAddMovieCharacterModel()
        let viewModel = AddMovieCharacterViewModel(router: router, model: model)
        let view = AddMovieCharacterView(viewModel: viewModel)
        self.router = router
        viewController = UIHostingController(rootView: view)
    }

}
