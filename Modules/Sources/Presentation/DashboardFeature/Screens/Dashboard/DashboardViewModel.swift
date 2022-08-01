//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import MovieCharactersDomain
import SwiftUI
import Utilities

final class DashboardViewModel: ObservableObject {

    // MARK: - Properties

    @Published private(set) var content: DashboardViewContent = .empty

    private let router: DashboardRouter
    private let model: DashboardModel

    private let container = SubscriptionsContainer()

    // MARK: - Initialization

    init(router: DashboardRouter, model: DashboardModel) {
        self.router = router
        self.model = model
    }

    // MARK: - API

    @MainActor
    func viewDidAppear() {
        Task { [weak self, model] in
            for await characters in model.observeCharacters() {
                guard let self = self else { return }
                self.content = self.makeContent(for: characters)
            }
        }
        .store(in: container)
    }

    func plusButtonTapped() {
        router.addNewCharacterTriggered()
    }

    // MARK: - Private

    private func makeContent(for characters: [MovieCharacter]) -> DashboardViewContent {
        let cellItems = characters.map { character in
            DashboardViewContent.MovieCharacterCellContent(id: character.id, name: character.name)
        }
        return DashboardViewContent(characters: cellItems)
    }

}
