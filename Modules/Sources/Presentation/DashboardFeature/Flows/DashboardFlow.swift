//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Combine
import SwiftUI
import Utilities
import MovieCharactersDomain

public final class DashboardFlow: Coordinator {

    // MARK: - Events

    public let addNewCharacter: AnyPublisher<StackScreenPresenter, Never>

    // MARK: - Properties

    private let window: UIWindow
    private let presenter: StackScreenPresenter
    private let movieCharactersServiceFactory: () -> MovieCharactersService
    private let _addNewCharacter = PassthroughSubject<StackScreenPresenter, Never>()

    private var container = Set<AnyCancellable>()

    // MARK: - Initialization

    public init(in window: UIWindow, movieCharactersServiceFactory: @escaping () -> MovieCharactersService) {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        presenter = DefaultStackScreenPresenter(navigationController: DefaultNavigationController(navigationController: navigationController))
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
        let screen = DashboardScreen(movieCharactersServiceFactory: movieCharactersServiceFactory)

        screen.router.addNewCharacter.sink { [_addNewCharacter, presenter] in
            _addNewCharacter.send(presenter)
        }.store(in: &container)
        
        presenter.replace(with: screen)
    }

}
