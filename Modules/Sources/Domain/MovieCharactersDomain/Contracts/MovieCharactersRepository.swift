//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

public protocol MovieCharactersRepository: AnyObject {

    func observeMovieCharacters() -> AsyncStream<[MovieCharacter]>
    func fetchMovieCharacters() async -> [MovieCharacter]
    func addToFavorites(movieCharacter: MovieCharacter) async
    func addMovieCharacter(name: String, isFavorite: Bool) async throws

}
