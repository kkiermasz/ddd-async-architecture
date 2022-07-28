//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import MovieCharactersDomain
import SwiftUI

final class AddMovieCharacterViewModel: ObservableObject {

    // MARK: - Properties

    @Published var name = ""
    @Published var isFavorite = false
    @Published private(set) var disabled = false

    private let router: AddMovieCharacterRouter
    private let model: AddMovieCharacterModel

    // MARK: - Initialization

    init(router: AddMovieCharacterRouter, model: AddMovieCharacterModel) {
        self.router = router
        self.model = model
    }

    // MARK: - API

    @MainActor
    func saveButtonTapped() {
        Task {
            do {
                disabled = true
                try await model.addMovieCharacter(name: name, isFavorite: isFavorite)
                router.finish()
            } catch {
                // :)
            }
        }
    }

}
