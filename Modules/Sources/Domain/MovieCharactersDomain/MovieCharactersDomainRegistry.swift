////  Copyright © 2022 Jakub Kiermasz. All rights reserved.

/// Dependency container as a service locator replacement
public final class MovieCharactersDomainRegistry {
    
    public static func movieCharactersService(with repository: MovieCharactersRepository) -> MovieCharactersService {
        instance.repository = repository
        let service = DefaultMovieCharactersService(movieCharactersRepository: repository)
        instance.movieCharactersService = service
        return service
    }

    // MARK: - Properties

    private var repository: MovieCharactersRepository?
    private var movieCharactersService: DefaultMovieCharactersService?

    private static let instance = MovieCharactersDomainRegistry()

    // MARK: - Initialization

    private init() {}

}
