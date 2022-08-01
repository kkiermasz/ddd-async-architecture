//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Foundation
import Combine

public final class SubscriptionsContainer {
    
    // MARK: - Properties
    
    private var set = Set<AnyCancellable>()
    private var taskCancellationClosures = [() -> Void]()
    
    // MARK: - Initialization
    
    public init() {}

    deinit {
        taskCancellationClosures.forEach { closure in closure() }
    }

    // MARK: - API
    
    public func add(cancellable: AnyCancellable) {
        set.insert(cancellable)
    }

    /// - Parameter task: Async task, which cannot be modified later. Otherwise it won't be cancelled.
    public func add<SuccessType: Sendable, FailureType: Error>(task: Task<SuccessType, FailureType>) {
        let closure = { task.cancel() }
        taskCancellationClosures.append(closure)
    }
    
}
