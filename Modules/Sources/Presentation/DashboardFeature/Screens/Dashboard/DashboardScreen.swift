//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import MovieCharactersDomain
import SwiftUI
import Utilities

final class DashboardScreen: Screen {

    // MARK: - Properties

    let viewController: UIViewController
    let router: DashboardRouter

    // MARK: - Initialization

    init(movieCharactersServiceFactory: () -> MovieCharactersService) {
        let router = DefaultDashboardRouter()
        let model = DefaultDashboardModel(service: movieCharactersServiceFactory())
        let viewModel = DashboardViewModel(router: router, model: model)
        let view = DashboardView(viewModel: viewModel)
        viewController = UIHostingController(rootView: view)
        viewController.navigationItem.title = "Movie characters"
        self.router = router
    }

}
