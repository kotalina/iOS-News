//
//  UITableViewCell+Defined.swift
//  NewsApp
//
//  Created by Алина Кошманова on 27.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    //MARK: - Properties
    
    enum ReuseIdentifier {
        
        enum News {
            static let newsItem = "NewsTableViewCell"
        }
        
    }
    
    
    //MARK: - Static
    
    static func nibFor(reuseIdentifier: String) -> UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}
