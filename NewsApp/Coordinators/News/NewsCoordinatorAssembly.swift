//
//  NewsCoordinatorAssembly.swift
//  NewsApp
//
//  Created by Алина Кошманова on 28.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import UIKit

class NewsCoordinatorAssembly {
    
    static func buildWith(output: NewsCoordinatorOutput) -> NewsCoordinator {

        let coordinator = NewsCoordinator()
        let router = NewsCoordinatorRouter()
        
        router.set(navigationController: output.navigationController() ?? UINavigationController())
        coordinator.set(output: output)
        coordinator.set(router: router)
        
        return coordinator
    }
    
}
