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
        self.id = model.id
        self.name = model.name
        self.isFavorite = model.isFavorite
    }

}
