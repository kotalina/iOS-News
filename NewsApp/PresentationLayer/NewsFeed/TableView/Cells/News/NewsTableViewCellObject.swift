//
//  NewsTableViewCellObject.swift
//  NewsApp
//
//  Created by Алина Кошманова on 27.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import UIKit

class NewsTableViewCellObject {
    
    //MARK: - Properties
    var title: String
    var author: String
    var date: Date?
    
    
    //MARK: Initialization
    
    init(title: String, author: String, date: Date?) {
        self.title = title
        self.author = author
        self.date = date
    }
    
}

//MARK: - BaseTableViewCellObject extension

extension NewsTableViewCellObject: BaseTableViewCellObject {
    
    func cellReuseIdentifier() -> String {
        return UITableViewCell.ReuseIdentifier.News.newsItem
    }
    
    func height() -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
