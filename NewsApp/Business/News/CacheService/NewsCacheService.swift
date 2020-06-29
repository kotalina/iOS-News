//
//  NewsCacheService.swift
//  NewsApp
//
//  Created by Алина Кошманова on 28.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import RealmSwift

class NewsCacheService {
    
    //MARK: - Properties
    var realm: Realm
    
    
    //MARK: - Initialization
    
    init?() {
        guard let realm = try? Realm() else { return nil }
        self.realm = realm
    }
    
    
    //MARK: - Store functions
    
    func store(newsElement: NewsElement) {
        
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(DateFormatter.apiDateFormatter)
        
        if let newsData = try? encoder.encode(newsElement) {
            
            let nsData = NSData(data: newsData)
            let news = NewsDatabaseObject(url: newsElement.url ?? String.empty, data: nsData)
            
            try? realm.write {
                self.realm.add(news, update: .modified)
            }
            
        }
    }
    
    func store(newsFeedElement: NewsFeedElement) {
        
        if let articles = newsFeedElement.articles {
            
            for article in articles {
                self.store(newsElement: article)
            }
        }
    }
    
    
    //MARK: - Obtain functions
    
    func obtainNews() -> [NewsElement] {
        
        var newsList: [NewsElement] = []
        
        let dataBaseObjects: Results<NewsDatabaseObject> = self.realm.objects(NewsDatabaseObject.self)
        
        for newObject in dataBaseObjects {
            
            if let news = self.newsObjectToNews(newsObject: newObject) {
                newsList.append(news)
            }

        }
        
        print(self.realm.objects(NewsDatabaseObject.self).count)
        
        return newsList
        
    }
    
    
    //MARK: - Helpers functions
    
    func newsObjectToNews(newsObject: NewsDatabaseObject) -> NewsElement? {
        
        var news: NewsElement?
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.apiDateFormatter)
        
        do {
            news = try? decoder.decode(NewsElement.self, from: Data(newsObject.data))
        }
        
        return news
    }
    

}
