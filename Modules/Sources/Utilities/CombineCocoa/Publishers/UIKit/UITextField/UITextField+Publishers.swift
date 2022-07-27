// Created by Jakub Kiermasz on 13/09/2021.
// Copyright © 2021 SpotOn. All rights reserved.

import Combine
import UIKit

extension UITextField {
    public var textChanged: AnyPublisher<String, Never> {
        publisher(for: [.allEditingEvents, .valueChanged])
            .map { self.text ?? "" }
            .eraseToAnyPublisher()
    }

    public var editingBegan: AnyPublisher<Void, Never> {
        publisher(for: .editingDidBegin).eraseToAnyPublisher()
    }

    public var editingEnded: AnyPublisher<Void, Never> {
        publisher(for: .editingDidEnd).eraseToAnyPublisher()
    }

    public var returnTapped: AnyPublisher<Void, Never> {
        publisher(for: .editingDidEndOnExit).eraseToAnyPublisher()
    }
}
