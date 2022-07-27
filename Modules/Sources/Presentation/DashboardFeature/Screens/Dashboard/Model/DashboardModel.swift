//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import MovieCharactersDomain

protocol DashboardModel: AnyObject {

    func observeCharacters() -> AsyncStream<[MovieCharacter]>

}
