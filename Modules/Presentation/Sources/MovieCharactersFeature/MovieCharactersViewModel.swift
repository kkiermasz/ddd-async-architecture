//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import MovieCharactersDomain
import SwiftUI

final class MovieCharactersViewModel: ObservableObject {

    // MARK: - Properties

    @Published private(set) var content: MovieCharactersViewContent = .empty

    private let model: MovieCharactersModel

    // MARK: - Initialization

    init(model: MovieCharactersModel) {
        self.model = model
    }

    // MARK: - API

    @MainActor
    func viewDidAppear() {
        Task {
            for await characters in model.observeCharacters() {
                content = makeContent(for: characters)
            }
        }
    }

    // MARK: - Private

    private func makeContent(for characters: [MovieCharacter]) -> MovieCharactersViewContent {
        let cellItems = characters.map { character in
            MovieCharactersViewContent.MovieCharacterCellContent(id: character.id, name: character.name)
        }
        return MovieCharactersViewContent(characters: cellItems)
    }

}
