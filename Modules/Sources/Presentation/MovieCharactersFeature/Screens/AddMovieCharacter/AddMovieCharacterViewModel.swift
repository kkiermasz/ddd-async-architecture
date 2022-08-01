//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import MovieCharactersDomain
import SwiftUI
import Utilities

final class AddMovieCharacterViewModel: ObservableObject {

    // MARK: - Properties

    @Published var name = ""
    @Published var isFavorite = false
    @Published private(set) var disabled = false

    private let router: AddMovieCharacterRouter
    private let model: AddMovieCharacterModel

    private let container = SubscriptionsContainer()

    // MARK: - Initialization

    init(router: AddMovieCharacterRouter, model: AddMovieCharacterModel) {
        self.router = router
        self.model = model
    }

    // MARK: - API

    @MainActor
    func saveButtonTapped() {
        Task { [weak self, model, router] in
            do {
                self?.disabled = true
                guard let self = self else { return }
                try await model.addMovieCharacter(name: self.name, isFavorite: self.isFavorite)
                router.finish()
            } catch {
                // :)
            }
        }
        .store(in: container)
    }

}
