//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

@testable import MovieCharactersFeature

import Combine
import XCTest

final class AddMovieCharacterViewModel_Tests: XCTestCase {

    func test_SaveButtonTapped_CallsModel() async {
        let expectation = expectation(description: "`addMovieCharacter` Called")
        let stub = AddMovieCharacterModelStub()
        let sut = AddMovieCharacterViewModel(router: AddMovieCharacterRouterDummy(), model: stub)
        stub.addMovieCharacterCalledHandler = {
            expectation.fulfill()
        }
        await sut.saveButtonTapped()
        await waitForExpectations(timeout: 5)
    }

}

fileprivate final class AddMovieCharacterModelStub: AddMovieCharacterModel {
    var addMovieCharacterCalledHandler: (() -> Void)?

    func addMovieCharacter(name: String, isFavorite: Bool)
    async throws {
        addMovieCharacterCalledHandler?()
    }
}

fileprivate final class AddMovieCharacterRouterDummy: AddMovieCharacterRouter {
    let finished = Just(()).eraseToAnyPublisher()
    func finish() {}
}
