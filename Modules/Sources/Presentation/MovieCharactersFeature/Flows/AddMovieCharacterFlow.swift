//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Combine
import SwiftUI
import Utilities

public final class AddMovieCharacterFlow: Coordinator {

    // MARK: - Events

    public let finished: AnyPublisher<Void, Never>

    // MARK: - Properties

    private let navigationController: UINavigationController
    private let _finished = PassthroughSubject<Void, Never>()

    // MARK: - Initialization

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController

        finished = _finished.eraseToAnyPublisher()
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
