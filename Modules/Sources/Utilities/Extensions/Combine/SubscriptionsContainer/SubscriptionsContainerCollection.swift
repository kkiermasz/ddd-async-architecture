//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Foundation
import Combine

public final class SubscriptionsContainerCollection {
    
    // MARK: - Properties
    
    private var indexedContainers: [IndexPath: SubscriptionsContainer] = [:]
    private var describedContainers: [String: SubscriptionsContainer] = [:]
    
    // MARK: - Initializers
    
    public init() {}
    
    // MARK: - API

    public func container(for indexPath: IndexPath) -> SubscriptionsContainer {
        let container = SubscriptionsContainer()
        indexedContainers[indexPath] = container
        return container
    }
    
    public func container(for anyClass: AnyClass) -> SubscriptionsContainer {
        let container = SubscriptionsContainer()
        describedContainers[anyClass.description()] = container
        return container
    }
    
    public func removeAll() {
        indexedContainers.removeAll(keepingCapacity: true)
        describedContainers.removeAll(keepingCapacity: true)
    }
    
}
