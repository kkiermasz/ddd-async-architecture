//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import MovieCharactersDomain

extension MovieCharactersView {
    public init(service: MovieCharactersService) {
        let model = DefaultMovieCharactersModel(service: service)
        self.init(viewModel: MovieCharactersViewModel(model: model))
    }
}

