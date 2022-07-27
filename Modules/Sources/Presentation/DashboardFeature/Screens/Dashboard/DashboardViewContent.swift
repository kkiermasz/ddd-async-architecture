//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

struct DashboardViewContent: Hashable {

    let characters: [MovieCharacterCellContent]

}

extension DashboardViewContent {

    static var empty: Self {
        .init(characters: [])
    }

}
