//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

struct MovieCharactersViewContent: Hashable {

    let characters: [MovieCharacterCellContent]

}

extension MovieCharactersViewContent {

    static var empty: Self {
        .init(characters: [])
    }

}
