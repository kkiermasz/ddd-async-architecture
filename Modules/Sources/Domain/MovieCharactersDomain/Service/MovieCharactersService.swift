//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Foundation

public protocol MovieCharactersService: AnyObject {
    func movieCharacters() -> AsyncStream<[MovieCharacter]>
    func markAsFavorite(movieCharacterId: UUID) async throws
    func addMovieCharacter(name: String, isFavorite: Bool) async throws
}
