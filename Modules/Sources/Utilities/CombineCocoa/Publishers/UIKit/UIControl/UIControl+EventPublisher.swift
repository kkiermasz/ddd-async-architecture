// Created by Jakub Kiermasz on 13/09/2021.
// Copyright © 2021 SpotOn. All rights reserved.

import Combine
import Foundation
import UIKit

extension UIControl {
    struct EventPublisher: Publisher {
        // MARK: - Types

        typealias Output = Void
        typealias Failure = Never

        // MARK: - Properties

        private var control: UIControl
        private var event: Event

        // MARK: - Initialization

        init(control: UIControl, event: Event) {
            self.control = control
            self.event = event
        }

        // MARK: - API

        func receive<S>(subscriber: S) where S: Subscriber, Self.Failure == S.Failure, Self.Output == S.Input {
            let subscription = EventSubscription(target: subscriber, control: control) { control, listener, action in
                control?.addTarget(listener, action: action, for: event)
            } removeTargetAction: { control, listener, action in
                control?.removeTarget(listener, action: action, for: event)
            }

            subscriber.receive(subscription: subscription)
        }
    }
}
