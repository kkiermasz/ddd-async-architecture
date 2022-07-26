//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import MovieCharactersDomain

protocol MovieCharactersModel: AnyObject {

    func observeCharacters() -> AsyncStream<[MovieCharacter]>

}
