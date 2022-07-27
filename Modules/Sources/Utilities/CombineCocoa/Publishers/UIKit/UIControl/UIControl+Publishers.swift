// Created by Jakub Kiermasz on 13/09/2021.
// Copyright © 2021 SpotOn. All rights reserved.

import Combine
import UIKit

extension UIControl {
    public func publisher(for event: Event) -> AnyPublisher<Void, Never> {
        EventPublisher(control: self, event: event).eraseToAnyPublisher()
    }

    public var tapped: AnyPublisher<Void, Never> {
        publisher(for: .touchUpInside).eraseToAnyPublisher()
    }
}
