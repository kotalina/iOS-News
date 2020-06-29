//
//  NewsCoordinatorRouter.swift
//  NewsApp
//
//  Created by Алина Кошманова on 28.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import UIKit

class NewsCoordinatorRouter {
    
    //MARK: - Properties
    private var navigationController: UINavigationController?
    
    
    //MARK: - Incapsulation
    
    func set(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}


//MARK: - Router

extension NewsCoordinatorRouter: NewsCoordinatorRouterInterface {
    
    func openFeedScreenWith(output: NewsFeedModuleOutput) -> NewsFeedModuleInput? {
        let newsFeedModule: (view: UIViewController?, input: NewsFeedModuleInput?) = NewsFeedAssembly.buildWith(output: output)
        
        if let feedScreen = newsFeedModule.view {
            self.navigationController?.pushViewController(feedScreen, animated: true)
        }
        
        return newsFeedModule.input
    }

}
