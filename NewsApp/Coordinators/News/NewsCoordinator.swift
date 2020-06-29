//
//  NewsCoordinator.swift
//  NewsApp
//
//  Created by Алина Кошманова on 28.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import UIKit

class NewsCoordinator {
    
    //MARK: - Properties
    private var output: NewsCoordinatorOutput?
    private var router: NewsCoordinatorRouterInterface?
    private var newsModuleInput: NewsFeedModuleInput?
    
    
    //MARK: - Incapsulation
    
    func set(output: NewsCoordinatorOutput) {
        self.output = output
    }
    
    func set(router: NewsCoordinatorRouterInterface) {
        self.router = router
    }
    
}


//MARK: - Coordinator

extension NewsCoordinator: CoordinatorInterface {
    
    func start() {
        self.newsModuleInput = self.router?.openFeedScreenWith(output: self)
    }
    
    func navigationController() -> UINavigationController? {
        return self.output?.navigationController()
    }
    
}


//MARK: - NewsFeedModuleOutput

extension NewsCoordinator: NewsFeedModuleOutput {
        
}

