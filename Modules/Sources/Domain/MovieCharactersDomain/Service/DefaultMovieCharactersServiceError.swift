//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Foundation

enum DefaultMovieCharactersServiceError: LocalizedError {
    case noCharacter(withId: UUID)
}

