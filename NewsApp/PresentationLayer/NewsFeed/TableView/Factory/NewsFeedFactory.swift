//
//  NewsFeedFactory.swift
//  NewsApp
//
//  Created by Алина Кошманова on 27.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation

class NewsFeedFactory {
    
    func buildNewsFeed(newsFeed: [NewsElement]) -> [NewsTableViewCellObject] {
        
        var cellObjects: [NewsTableViewCellObject] = []
        
        for news in newsFeed {
            cellObjects.append(buildNewsCellObject(news: news))
        }
        
        return cellObjects
    }
    
    
    //MARK: - Private functions
    
    private func buildNewsCellObject(news: NewsElement) -> NewsTableViewCellObject {
        return NewsTableViewCellObject(title: news.title ?? String.empty, author: news.author ?? String.empty, date: news.publishedAt)
    }
}
