//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

extension AsyncStream {
    @preconcurrency func map<Transformed>(_ transform: @escaping (Self.Element) async -> Transformed) -> AsyncStream<Transformed> {
        AsyncStream<Transformed> { continuation in
            Task {
                for await element in self {
                    let transformed = await transform(element)
                    continuation.yield(transformed)
                }
            }
        }
    }
}
