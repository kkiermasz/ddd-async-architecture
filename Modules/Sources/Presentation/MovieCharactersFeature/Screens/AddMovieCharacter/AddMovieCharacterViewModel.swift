//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import MovieCharactersDomain
import SwiftUI

final class AddMovieCharacterViewModel: ObservableObject {

    // MARK: - Properties

    @Published private(set) var content: AddMovieCharacterViewContent = AddMovieCharacterViewContent()

    private let router: AddMovieCharacterRouter
    private let model: AddMovieCharacterModel

    // MARK: - Initialization

    init(router: AddMovieCharacterRouter, model: AddMovieCharacterModel) {
        self.router = router
        self.model = model
    }

    // MARK: - API

    func saveButtonTapped() {
//        router.
    }

}
