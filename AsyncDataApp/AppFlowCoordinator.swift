//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Combine
import DashboardFeature
import MovieCharactersData
import MovieCharactersDomain
import MovieCharactersFeature
import SwiftUI
import Utilities

final class AppFlowCoordinator: Coordinator {

    // MARK: - Properties

    private let window: UIWindow

    private var container = Set<AnyCancellable>()

    private var childCoordinators: [Coordinator] = [] {
        didSet {
            childCoordinators.filter { coordinator in !oldValue.contains(where: { oldFlow in oldFlow === coordinator }) }.forEach { coordinator in coordinator.start() }
        }
    }

    // MARK: - Initialization

    init(in window: UIWindow) {
        self.window = window
    }

    // MARK: - Coordinator

    func start() {
        startDashboardFlow()
    }

    // MARK: - Private

    private func startDashboardFlow() {
        let flow = DashboardFlow(in: window) { Self.service }

        flow.addNewCharacter.sink { [weak self] presenter in
            self?.startAddMovieCharacterFlow(with: presenter)
        }
        .store(in: &container)

        childCoordinators.append(flow)
    }

    private func startAddMovieCharacterFlow(with presenter: StackScreenPresenter) {
        let flow = AddMovieCharacterFlow(presenter: presenter) { Self.service }

        flow.finished.sink { [weak self] in
            self?.childCoordinators.removeLast()
        }
        .store(in: &container)

        childCoordinators.append(flow)
    }

}

extension AppFlowCoordinator {
    fileprivate static var repository: MovieCharactersRepository {
        MovieCharactersDataDependencyRegistry.movieCharactersRepository
    }
    fileprivate static var service: MovieCharactersService {
        MovieCharactersDomainRegistry.movieCharactersService(with: repository)
    }
}

