//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Combine
import SwiftUI
import Utilities
import MovieCharactersDomain

public final class DashboardFlow: Coordinator {

    // MARK: - Events

    let addNewCharacter: AnyPublisher<Void, Never>

    // MARK: - Properties

    private let window: UIWindow
    private let navigationController: UINavigationController
    private let movieCharactersServiceFactory: () -> MovieCharactersService
    private let _addNewCharacter = PassthroughSubject<Void, Never>()

    private var container = Set<AnyCancellable>()

    // MARK: - Initialization

    public init(in window: UIWindow, movieCharactersServiceFactory: @escaping () -> MovieCharactersService) {
        navigationController = UINavigationController()
        window.rootViewController = navigationController
        self.window = window
        self.movieCharactersServiceFactory = movieCharactersServiceFactory

        addNewCharacter = _addNewCharacter.eraseToAnyPublisher()
    }

    // MARK: - Flow

    public func start() {
        presentDashboardScreen()
        window.makeKeyAndVisible()
    }

    // MARK: - Private

    private func presentDashboardScreen() {
        let router = DefaultDashboardRouter()
        let model = DefaultDashboardModel(service: movieCharactersServiceFactory())
        let viewModel = DashboardViewModel(router: router, model: model)
        let view = DashboardView(viewModel: viewModel)
        let screen = UIHostingController(rootView: view)
        screen.navigationItem.title = "Movie characters"

        router.addNewCharacter.sink { [_addNewCharacter] in
            _addNewCharacter.send(())
        }.store(in: &container)

        navigationController.setViewControllers([screen], animated: false)
    }

}
