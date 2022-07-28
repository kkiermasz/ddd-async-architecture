//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import MovieCharactersDomain
import SwiftUI
import Utilities

final class AddMovieCharacterScreen: Screen {

    // MARK: - Properties

    let viewController: UIViewController
    let router: AddMovieCharacterRouter

    // MARK: - Initialization

    init(movieCharactersServiceFactory: () -> MovieCharactersService) {
        let router = DefaultAddMovieCharacterRouter()
        let model = DefaultAddMovieCharacterModel(service: movieCharactersServiceFactory())
        let viewModel = AddMovieCharacterViewModel(router: router, model: model)
        let view = AddMovieCharacterView(viewModel: viewModel)
        self.router = router
        viewController = UIHostingController(rootView: view)
        viewController.navigationItem.title = "Add new character"
    }

}
