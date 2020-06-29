//
//  NewsFeedAssembly.swift
//  NewsApp
//
//  Created by Алина Кошманова on 27.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import UIKit

class NewsFeedAssembly {
    
    static func buildWith(output: NewsFeedModuleOutput) -> (view: UIViewController?, input: NewsFeedModuleInput?) {
        
       // Creating components
        let viewController = NewsFeedViewController()
        let presenter = NewsFeedPresenter()
        
        // Injecting properties
        presenter.set(view: viewController)
        presenter.set(output: output)
        viewController.set(output: presenter)
        
        return (viewController, presenter)
    }
    
}
