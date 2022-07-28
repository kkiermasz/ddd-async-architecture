//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Combine

final class DefaultAddMovieCharacterRouter: AddMovieCharacterRouter {

    // MARK: - Properties

    let finished: AnyPublisher<Void, Never>

    private let _finished = PassthroughSubject<Void, Never>()

    // MARK: - Initialization

    init() {
        finished = _finished.eraseToAnyPublisher()
    }

    // MARK: - AddMovieCharacterRouter

    func finish() {
        _finished.send(())
    }

}
