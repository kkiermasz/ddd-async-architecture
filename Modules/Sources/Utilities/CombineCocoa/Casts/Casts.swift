// Created by Jakub Kiermasz on 21/01/2022.
// Copyright © 2022 SpotOn. All rights reserved.

import Foundation

func castOrThrow<ReturnType>(_ object: Any) throws -> ReturnType {
    guard let returnValue = object as? ReturnType else {
        throw CombineCocoaError.castingError(object: object, targetType: ReturnType.self)
    }
    return returnValue
}
