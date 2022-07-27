// Created by Jakub Kiermasz on 21/01/2022.
// Copyright © 2021 SpotOn. All rights reserved.

import Combine
import Foundation

final class DelegateProxyPublisher<Output>: Publisher {
    // MARK: - Type Aliases

    typealias Failure = Never

    // MARK: - Properties

    private let handler: (AnySubscriber<Output, Failure>) -> Void

    // MARK: - Initialization

    init(_ handler: @escaping (AnySubscriber<Output, Failure>) -> Void) {
        self.handler = handler
    }

    // MARK: - Internal

    func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, Output == S.Input {
        let subscription = Subscription(subscriber: AnySubscriber(subscriber), handler: handler)
        subscriber.receive(subscription: subscription)
    }
}

extension DelegateProxyPublisher {
    fileprivate final class Subscription<S>: Combine.Subscription where S: Subscriber, Failure == S.Failure, Output == S.Input {
        private var subscriber: S?

        init(subscriber: S, handler: @escaping (S) -> Void) {
            self.subscriber = subscriber
            handler(subscriber)
        }

        func request(_: Subscribers.Demand) {
            // We don't care for the demand.
        }

        func cancel() {
            subscriber = nil
        }
    }
}
