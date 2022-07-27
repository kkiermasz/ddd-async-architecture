//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import SwiftUI
import Utilities
import MovieCharactersDomain

final class DashboardFlow: Coordinator {

    // MARK: - Properties

    private let window: UIWindow
    private let navigationController: UINavigationController

    private let movieCharactersServiceFactory: () -> MovieCharactersService

    // MARK: - Initialization

    init(in window: UIWindow, movieCharactersServiceFactory: @escaping () -> MovieCharactersService) {
        navigationController = UINavigationController()
        window.rootViewController = navigationController
        self.window = window
        self.movieCharactersServiceFactory = movieCharactersServiceFactory
    }

    // MARK: - Flow

    func start() {
        presentDashboardScreen()
        window.makeKeyAndVisible()
    }

    // MARK: - Private

    private func presentDashboardScreen() {
        let router = DefaultDashboardRouter()
        let model = DefaultDashboardModel(service: movieCharactersServiceFactory())
        let viewModel = DashboardViewModel(router: router, model: model)
        let screen = DashboardView(viewModel: viewModel)
    }

}
