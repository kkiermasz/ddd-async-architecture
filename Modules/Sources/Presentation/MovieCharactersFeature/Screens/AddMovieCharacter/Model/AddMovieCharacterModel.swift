//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import MovieCharactersDomain

protocol AddMovieCharacterModel: AnyObject {

    func addMovieCharacter(name: String, isFavorite: Bool) async throws
    func observeCharacters() -> AsyncStream<[MovieCharacter]>

}
