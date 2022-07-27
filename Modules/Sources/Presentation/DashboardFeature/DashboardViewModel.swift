//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import MovieCharactersDomain
import SwiftUI

final class DashboardViewModel: ObservableObject {

    // MARK: - Properties

    @Published private(set) var content: DashboardViewContent = .empty

    private let model: DashboardModel

    // MARK: - Initialization

    init(model: DashboardModel) {
        self.model = model
    }

    // MARK: - API

    @MainActor
    func viewDidAppear() {
        // check dealloc
        Task {
            for await characters in model.observeCharacters() {
                content = makeContent(for: characters)
            }
        }
    }

    // MARK: - Private

    private func makeContent(for characters: [MovieCharacter]) -> DashboardViewContent {
        let cellItems = characters.map { character in
            DashboardViewContent.MovieCharacterCellContent(id: character.id, name: character.name)
        }
        return DashboardViewContent(characters: cellItems)
    }

}
