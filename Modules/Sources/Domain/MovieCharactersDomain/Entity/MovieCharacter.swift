//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Foundation

public struct MovieCharacter: Equatable {
    public let id: UUID
    public let name: String
    public let isFavorite: Bool

    public init(id: UUID, name: String, isFavorite: Bool) {
        self.id = id
        self.name = name
        self.isFavorite = isFavorite
    }
}
