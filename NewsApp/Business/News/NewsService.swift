//
//  NewsService.swift
//  NewsApp
//
//  Created by Алина Кошманова on 28.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation

class NewsService {
    
    //MARK: - Constants
    //Paths
    static let newsFeedPath = "everything"
    
    //Components
    enum Component {
        static let searchWordComponent = "q"
        static let fromDateWordComponent = "from"
        static let sortByComponent = "sortBy"
        static let apiKeyComponent = "apiKey"
    }
    
    //DefaultsKeyValues
    static let defaultSearchValue = "Россия"
    static let defaultSortByValue = "publishedAt"
    static let defaultDate = Date()
    
    //MARK: - Properties
    let client = RequestService()
    let newsCacheService = NewsCacheService()
    
    
    //MARK: - Service funcions
    
    func newsFor(searchWord: String?, date: Date?, success: @escaping (() -> Void), failure: @escaping ((_ errorMessage: String) -> Void)) {
        
        let searchString = searchWord != nil && searchWord!.count > 0 ? searchWord : NewsService.defaultSearchValue
        let requestDate = (date ?? NewsService.defaultDate).dateToString(dateFormat: String.DateFormat.dateForGettingNewsRequest)
        
        let parameters = [Component.searchWordComponent: searchString,
                          Component.fromDateWordComponent: requestDate,
                          Component.sortByComponent: NewsService.defaultSortByValue,
                          Component.apiKeyComponent: String.Bundle.apiKey] as? [String: String]
        
        
        self.client.get(path: NewsService.newsFeedPath, parameters:parameters, success: { (response) in
            
            if let responseDictionary = response as? [String: Any] {
                
                if let data = try? JSONSerialization.data(withJSONObject: responseDictionary, options: .prettyPrinted) {
                    
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(DateFormatter.apiDateFormatter)
                    
                    if let newsFeed = try? decoder.decode(NewsFeedElement.self, from: data) {
                        self.newsCacheService?.store(newsFeedElement: newsFeed)
                        success()
                    } else {
                        failure(String.NetworkError.unknown)
                    }
                    
                } else {
                    failure(String.NetworkError.unknown)
                }
                
            } else {
                failure(String.NetworkError.unknown)
            }
            
        }) { (statusCode, errorMessage) in
            failure(errorMessage ?? String.NetworkError.unknown)
        }
        
    }

}
