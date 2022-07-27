//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import SwiftUI
import Utilities

struct DashboardView: View {

    // MARK: - Properties

    @ObservedObject private var viewModel: DashboardViewModel

    // MARK: - Initialization

    init(viewModel: DashboardViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - View

    var body: some View {
        List(viewModel.content.characters, id: \.id) { character in
            Text(character.name)
        }
        .listStyle(.insetGrouped)
        .onFirstAppear {
            viewModel.viewDidAppear()
        }
    }

}
