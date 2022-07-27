//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import MovieCharactersDomain

final class DefaultDashboardModel: DashboardModel {

    // MARK: - Properties

    private let service: MovieCharactersService

    // MARK: - Initialization

    init(service: MovieCharactersService) {
        self.service = service
    }

    // MARK: - MovieCharactersModel

    func observeCharacters() -> AsyncStream<[MovieCharactersDomain.MovieCharacter]> {
        service.movieCharacters()
    }

}
