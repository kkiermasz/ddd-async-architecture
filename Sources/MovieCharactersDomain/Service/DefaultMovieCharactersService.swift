//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Foundation

final class DefaultMovieCharactersService: MovieCharactersService {

    // MARK: - Properties

    private let movieCharactersRepository: MovieCharactersRepository

    // MARK: - Initialization

    init(movieCharactersRepository: MovieCharactersRepository) {
        self.movieCharactersRepository = movieCharactersRepository
    }

    // MARK: - MovieCharactersService

    func movieCharacters() -> AsyncStream<[MovieCharacter]> {
        movieCharactersRepository.observeMovieCharacters()
    }

    func markAsFavorite(movieCharacterId: UUID) async throws {
        let characters = await movieCharactersRepository.fetchMovieCharacters()
        guard let character = characters.first(where: { $0.id == movieCharacterId }) else {
            throw DefaultMovieCharactersServiceError.noCharacter(withId: movieCharacterId)
        }
        await movieCharactersRepository.addToFavorites(movieCharacter: character)
    }

    func addMovieCharacter(_ character: MovieCharacter) {
        movieCharactersRepository.addMovieCharacter(character)
    }

}

enum DefaultMovieCharactersServiceError: LocalizedError {
    case noCharacter(withId: UUID)
}

protocol MovieCharactersRepository: AnyObject {

    func observeMovieCharacters() -> AsyncStream<[MovieCharacter]>
    func fetchMovieCharacters() async -> [MovieCharacter]
    func addToFavorites(movieCharacter: MovieCharacter) async
    func addMovieCharacter(_ character: MovieCharacter)

}

//extension AsyncStream {
//    @preconcurrency func map<Transformed>(_ transform: @escaping (Self.Element) async -> Transformed) -> AsyncStream<Transformed> {
//        AsyncStream<Transformed> { continuation in
//            Task {
//                for await element in self {
//                    let transformed = await transform(element)
//                    continuation.yield(transformed)
//                }
//            }
//        }
//    }
//}
