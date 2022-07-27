// Created by Jakub Kiermasz on 21/01/2022.
// Copyright © 2022 SpotOn. All rights reserved.

import Foundation

public enum CombineCocoaError: Error, CustomDebugStringConvertible {
    // MARK: - Cases

    case castingError(object: Any, targetType: Any.Type)

    // MARK: - CustomDebugStringConvertible

    public var debugDescription: String {
        switch self {
        case let .castingError(object, targetType): return "Error casting `\(object)` to `\(targetType)`"
        }
    }
}
