// Created by Jakub Kiermasz on 13/09/2021.
// Copyright © 2021 SpotOn. All rights reserved.

import Combine
import Foundation
import UIKit

extension UIControl {
    final class EventSubscription<Target: Subscriber, Control: AnyObject>: Subscription where Target.Input == Void {
        // MARK: - Properties

        private var target: Target?
        private weak var control: Control?

        private let removeTargetAction: (Control?, AnyObject, Selector) -> Void

        // MARK: - Initialization

        init(target: Target,
             control: Control,
             addTargetAction: @escaping (Control?, AnyObject, Selector) -> Void,
             removeTargetAction: @escaping (Control?, AnyObject, Selector) -> Void)
        {
            self.target = target
            self.control = control
            self.removeTargetAction = removeTargetAction

            addTargetAction(control, self, #selector(receive))
        }

        // MARK: - API

        /// This subscription doesn't respond to demand
        func request(_: Subscribers.Demand) {}

        func cancel() {
            target = nil
            removeTargetAction(control, self, #selector(receive))
        }

        // MARK: - Actions

        @objc
        private func receive() {
            _ = target?.receive()
        }
    }
}
