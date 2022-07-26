//
//  AsyncDataAppApp.swift
//  AsyncDataApp
//
//  Created by Jakub Kiermasz on 26/07/2022.
//

import MovieCharactersDomain
import DashboardFeature
import MovieCharactersData
import SwiftUI

@main
struct AsyncDataAppApp: App {
    var body: some Scene {
        WindowGroup {
            DashboardView()
        }
    }
}

extension DashboardView {
    init() {
        let repository = MovieCharactersDataDependencyRegistry.movieCharactersRepository
        let service = MovieCharactersDomainRegistry.movieCharactersService(with: repository)
        self.init(service: service)
    }
}
