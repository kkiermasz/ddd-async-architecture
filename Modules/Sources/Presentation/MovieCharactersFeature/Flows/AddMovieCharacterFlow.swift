//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Combine
import SwiftUI
import Utilities
import MovieCharactersDomain

public final class AddMovieCharacterFlow: Coordinator {

    // MARK: - Events

    public let finished: AnyPublisher<Void, Never>

    // MARK: - Properties

    private let presenter: StackScreenPresenter
    private let movieCharactersServiceFactory: () -> MovieCharactersService
    private let _finished = PassthroughSubject<Void, Never>()

    private var container = Set<AnyCancellable>()

    // MARK: - Initialization

    public init(presenter: StackScreenPresenter, movieCharactersServiceFactory: @escaping () -> MovieCharactersService) {
        self.presenter = presenter
        self.movieCharactersServiceFactory = movieCharactersServiceFactory

        finished = _finished.eraseToAnyPublisher()
    }

    // MARK: - Flow

    public func start() {
        presentAddMovieCharacterScreen()
    }

    // MARK: - Private

    private func presentAddMovieCharacterScreen() {
        let screen = AddMovieCharacterScreen(movieCharactersServiceFactory: movieCharactersServiceFactory)

        screen.router.finished.sink { [_finished, presenter] in
            presenter.pop()
            _finished.send(())
        }
        .store(in: &container)

        presenter.push(screen) { [_finished] in
            _finished.send(())
        }
    }

}
