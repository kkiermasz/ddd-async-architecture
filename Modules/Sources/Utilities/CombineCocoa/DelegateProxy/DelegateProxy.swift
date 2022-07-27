// Created by Jakub Kiermasz on 21/01/2022.
// Copyright © 2021 SpotOn. All rights reserved.

import Combine
import CombineCocoaRuntime
import Foundation

class DelegateProxy: ObjcDelegateProxy {
    // MARK: - Properties

    private var dict: [Selector: [([Any]) -> Void]] = [:]
    private var subscribers = [AnySubscriber<[Any], Never>?]()

    // MARK: - Initialization

    override required init() {
        super.init()
    }

    deinit {
        subscribers.forEach { $0?.receive(completion: .finished) }
        subscribers = []
    }

    // MARK: - Override

    override func interceptedSelector(_ selector: Selector, arguments: [Any]) {
        dict[selector]?.forEach { handler in
            handler(arguments)
        }
    }

    func intercept(_ selector: Selector, _ handler: @escaping ([Any]) -> Void) {
        if dict[selector] != nil {
            dict[selector]?.append(handler)
        } else {
            dict[selector] = [handler]
        }
    }

    func methodInvoked(_ selector: Selector) -> AnyPublisher<[Any], Never> {
        DelegateProxyPublisher<[Any]> { subscriber in
            self.subscribers.append(subscriber)
            return self.intercept(selector) { args in
                _ = subscriber.receive(args)
            }
        }.eraseToAnyPublisher()
    }
}
