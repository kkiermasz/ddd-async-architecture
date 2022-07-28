//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import SwiftUI

struct AddMovieCharacterView: View {

    // MARK: - Properties

    @ObservedObject private var viewModel: AddMovieCharacterViewModel

    // MARK: - Initialization

    init(viewModel: AddMovieCharacterViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - View

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $viewModel.name)
                Toggle("Is favorite", isOn: $viewModel.isFavorite)
            }
        }
        .toolbar {
            Button {
                viewModel.saveButtonTapped()
            } label: {
                Text("Save")
            }
        }
        .disabled(viewModel.disabled)
    }

}
