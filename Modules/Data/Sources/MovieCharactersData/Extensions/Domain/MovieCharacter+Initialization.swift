//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import MovieCharactersDomain

extension MovieCharactersDomain.MovieCharacter {
    init(from dataModel: MovieCharacterDataModel) {
        self.init(id: dataModel.id, name: dataModel.name, isFavorite: dataModel.isFavorite)
    }
}
