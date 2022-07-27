//  Copyright © 2022 Jakub Kiermasz. All rights reserved.

import Combine

protocol DashboardRouter: AnyObject {

    var addNewCharacter: AnyPublisher<Void, Never> { get }

    func addNewCharacterTriggered()

}
