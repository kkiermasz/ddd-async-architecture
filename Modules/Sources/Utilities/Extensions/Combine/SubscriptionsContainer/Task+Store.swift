//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

extension Task {

    public func store(in container: SubscriptionsContainer) {
        container.add(task: self)
    }

}
