//
//  Coordinator.swift
//  NewsApp
//
//  Created by Алина Кошманова on 27.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import UIKit

class Coordinator {
    
    //MARK: - Properties
    private var navController = UINavigationController()
    
    
    //MARK: - UI
    
    func configureNavigationController() {
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.topItem?.hidesBackButton = true
    }
    
    
    //MARK: - Private
    
    private func showNewsFeedScreen() {
        let newsCoordinator = NewsCoordinatorAssembly.buildWith(output: self)
        newsCoordinator.start()
    }
}


//MARK: - CoordinatorType

extension Coordinator: CoordinatorInterface {
    
    func start() {
        self.navController = UINavigationController()
        UIApplication.shared.delegate?.window??.rootViewController = self.navController;
        UIApplication.shared.delegate?.window??.rootViewController?.view.layoutSubviews()
        self.configureNavigationController()
        
        self.showNewsFeedScreen()
    }
    
    func navigationController() -> UINavigationController? {
        return self.navController
    }
    
}

extension Coordinator: NewsCoordinatorOutput {
    
    func didFinishNewsCoordinator() {
        //
    }
    
    
}

