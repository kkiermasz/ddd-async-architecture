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

        }
    }

}
