//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import MovieCharactersDomain

/// Dependency container as a service locator replacement
public final class MovieCharactersDataDependencyRegistry {

    public static var movieCharactersRepository: MovieCharactersRepository { instance.movieCharactersRepository }

    // MARK: - Properties

    private lazy var movieCharactersRepository = MovieCharactersGateway()

    private static let instance = MovieCharactersDataDependencyRegistry()

    // MARK: - Initialization

    private init() {}

}
