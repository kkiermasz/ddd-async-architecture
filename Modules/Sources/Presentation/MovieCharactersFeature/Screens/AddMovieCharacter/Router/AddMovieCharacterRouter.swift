//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Combine

protocol AddMovieCharacterRouter: AnyObject {
    var finished: AnyPublisher<Void, Never> { get }
    func finish()
}
