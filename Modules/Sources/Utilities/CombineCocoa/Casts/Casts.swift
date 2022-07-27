//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Foundation

func castOrThrow<ReturnType>(_ object: Any) throws -> ReturnType {
    guard let returnValue = object as? ReturnType else {
        throw CombineCocoaError.castingError(object: object, targetType: ReturnType.self)
    }
    return returnValue
}
