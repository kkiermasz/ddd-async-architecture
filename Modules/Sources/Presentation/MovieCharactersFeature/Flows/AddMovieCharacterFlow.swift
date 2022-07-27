//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Combine
import SwiftUI
import Utilities

public final class AddMovieCharacterFlow: Coordinator {

    // MARK: - Events

    public let finished: AnyPublisher<Void, Never>

    // MARK: - Properties

    private let presenter: StackScreenPresenter
    private let _finished = PassthroughSubject<Void, Never>()

    // MARK: - Initialization

    public init(presenter: StackScreenPresenter) {
        self.presenter = presenter

        finished = _finished.eraseToAnyPublisher()
    }

    // MARK: - Flow

    public func start() {
        presentAddMovieCharacterScreen()
    }

    // MARK: - Private

    private func presentAddMovieCharacterScreen() {
        let screen = AddMovieCharacterScreen()

        presenter.push(screen) { [_finished] in
            _finished.send(())
        }
    }

}
