//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Combine

extension AnyCancellable {
    
    public func store(in container: SubscriptionsContainer) {
        container.add(cancellable: self)
    }
    
}
