//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import MovieCharactersDomain

final class DefaultAddMovieCharacterModel: AddMovieCharacterModel {

    // MARK: - Properties

    private let service: MovieCharactersService

    // MARK: - Initialization

    init(service: MovieCharactersService) {
        self.service = service
    }

    // MARK: - AddMovieCharacterModel

    func addMovieCharacter(name: String, isFavorite: Bool) async throws {
        try await service.addMovieCharacter(name: name, isFavorite: isFavorite)
    }

}
