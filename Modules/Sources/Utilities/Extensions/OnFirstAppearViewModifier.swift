//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import SwiftUI

struct OnFirstAppearViewModifier: ViewModifier {

    // MARK: - Properties

    @State private var loaded = false
    private let action: () -> Void

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
