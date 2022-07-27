//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import MovieCharactersDomain

extension DashboardView {
    public init(service: MovieCharactersService) {
        let model = DefaultDashboardModel(service: service)
        self.init(viewModel: DashboardViewModel(model: model))
    }
}

