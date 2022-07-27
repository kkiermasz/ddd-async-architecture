//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Foundation
import MovieCharactersDomain

struct MovieCharacterDataModel {

    // MARK: - Properties

    let id: UUID
    let name: String
    var isFavorite: Bool

    // MARK: - Initialization

    init(from model: MovieCharactersDomain.MovieCharacter) {
        id = model.id
        name = model.name
        isFavorite = model.isFavorite
    }

}
