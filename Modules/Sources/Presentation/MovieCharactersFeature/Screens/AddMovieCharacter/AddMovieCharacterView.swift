//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import SwiftUI

struct AddMovieCharacterView: View {

    // MARK: - Properties

    @ObservedObject private var viewModel: AddMovieCharacterViewModel

    @State private var name: String = ""
    @State private var isFavorite: Bool = false

    // MARK: - Initialization

    init(viewModel: AddMovieCharacterViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - View

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $name)
                Toggle("Is favorite", isOn: $isFavorite)
            }
        }
        .toolbar {
            Button {
                viewModel.saveButtonTapped()
            } label: {
                Text("Save")
            }
        }
    }

}
