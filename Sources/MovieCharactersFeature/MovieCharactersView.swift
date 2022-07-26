//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import SwiftUI

struct MovieCharactersView: View {

    // MARK: - Properties

    @ObservedObject private var viewModel: MovieCharactersViewModel

    // MARK: - Initialization



    init(viewModel: MovieCharactersViewModel) {
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



struct OnFirstAppearViewModifier: ViewModifier {

    // MARK: - Properties

    @State private var loaded = false
    private let action: (() -> Void)

    // MARK: - Initializers

    init(action: @escaping (() -> Void)) {
        self.action = action
    }

    // MARK: - API

    func body(content: Content) -> some View {
        content.onAppear {
            guard !loaded else { return }
            loaded = true
            action()
        }
    }
}

extension View {
    public func onFirstAppear(action: @escaping (() -> Void)) -> some View {
        modifier(OnFirstAppearViewModifier(action: action))
    }
}

