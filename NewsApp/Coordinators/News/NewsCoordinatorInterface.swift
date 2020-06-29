//
//  NewsCoordinatorInterface.swift
//  NewsApp
//
//  Created by Алина Кошманова on 28.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation

protocol NewsCoordinatorOutput: CoordinatorInterface {
    func didFinishNewsCoordinator()
}

protocol NewsCoordinatorRouterInterface {
    func openFeedScreenWith(output: NewsFeedModuleOutput) -> NewsFeedModuleInput?
}
