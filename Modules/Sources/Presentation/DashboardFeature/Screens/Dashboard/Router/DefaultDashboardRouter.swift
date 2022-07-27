//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Combine

final class DefaultDashboardRouter: DashboardRouter {

    // MARK: - Events

    let addNewCharacter: AnyPublisher<Void, Never>

    // MARK: - Properties

    private let _addNewCharacter = PassthroughSubject<Void, Never>()

    // MARK: - Initialization

    init() {
        addNewCharacter = _addNewCharacter.eraseToAnyPublisher()
    }

    // MARK: - DashboardRouter

    func addNewCharacterTriggered() {
        _addNewCharacter.send(())
    }

}
