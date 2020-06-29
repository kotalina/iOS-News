//
//  NewsFeedModel.swift
//  NewsApp
//
//  Created by Алина Кошманова on 28.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation

class NewsFeedElement: Codable {
    
    var status: String?
    var totalResults: NSInteger?
    var articles: [NewsElement]?
}
