// Created by Patrycja Biel on 30/09/2021.
// Copyright © 2021 SpotOn. All rights reserved.

import Combine
import UIKit

extension UIDatePicker {
    public var dateChanged: AnyPublisher<Date, Never> {
        publisher(for: .valueChanged).compactMap { [weak self] _ in self?.date }.eraseToAnyPublisher()
    }
}
