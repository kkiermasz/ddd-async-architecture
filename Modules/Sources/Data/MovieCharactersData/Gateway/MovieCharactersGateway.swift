//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Combine
import Foundation
import MovieCharactersDomain

final class MovieCharactersGateway: MovieCharactersRepository {

    // MARK: - Properties

    private var characters: [MovieCharacterDataModel] = [] {
        didSet {
            _charactersChanged.send(characters)
        }
    }

    private let _charactersChanged = PassthroughSubject<[MovieCharacterDataModel], Never>()

    private var container = Set<AnyCancellable>()

    // MARK: - MovieCharactersRepository

    func observeMovieCharacters() -> AsyncStream<[MovieCharactersDomain.MovieCharacter]> {
        AsyncStream { continuation in
            _charactersChanged.sink { characters in
                let data = characters.map { MovieCharactersDomain.MovieCharacter(from: $0) }
                continuation.yield(data)
            }
            .store(in: &container)
            let data = characters.map { MovieCharactersDomain.MovieCharacter(from: $0) }
            continuation.yield(data)
        }
    }

    func fetchMovieCharacters() async -> [MovieCharactersDomain.MovieCharacter] {
        characters.map { MovieCharactersDomain.MovieCharacter(from: $0) }
    }

    func addToFavorites(movieCharacter: MovieCharactersDomain.MovieCharacter) async {
        guard let index = characters.firstIndex(where: { $0.id == movieCharacter.id }) else { return }
        characters[index].isFavorite = true
    }

    func addMovieCharacter(_ character: MovieCharactersDomain.MovieCharacter) {
        characters.append(.init(from: character))
    }

}



