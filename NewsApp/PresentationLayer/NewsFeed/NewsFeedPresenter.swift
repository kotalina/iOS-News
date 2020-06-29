//
//  NewsFeedPresenter.swift
//  NewsApp
//
//  Created by Алина Кошманова on 27.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import UIKit

class NewsFeedPresenter {
    
    //MARK: - Properties
    private var output: NewsFeedModuleOutput?
    private var view: NewsFeedViewInput?
    private var factory = NewsFeedFactory()
    private var service = NewsService()
    private var cacheService = NewsCacheService()
    private var newsList: [NewsElement]?
    
    //MARK: - Incapsulation
    
    func set(view: NewsFeedViewInput) {
        self.view = view
    }
    
    func set(output: NewsFeedModuleOutput) {
        self.output = output
    }
    
    
    //MARK: - Private
    
    private func loadNewsFor(searchWorld: String?,
                             date: Date?,
                             success: @escaping (() -> Void),
                             failure: @escaping ((_ errorMessage: String) -> Void)) {
        
        self.service.newsFor(searchWord: searchWorld, date: date, success: success, failure: failure)
    }
    
    private func loadNewsFromCache() {
        self.newsList = self.cacheService?.obtainNews()
    }
    
    private func firstLoadAndUpdateNewsListIfNeeded() {

        self.loadNewsFromCache()
        
        if let news = self.newsList {
            if news.count == 0 {
                self.loadNewsFor(searchWorld: nil, date: nil, success: {
                    self.loadNewsFromCache()
                    self.reloadCellObjects()
                }) { (errorMessage) in
                    self.view?.showErrorAlert(title: errorMessage)
                }
            } else {
                self.reloadCellObjects()
            }
        }
        
        self.view?.needHideLoaderIndicator(needHide: true)
    }
    
    private func reloadCellObjects() {
        if let news = self.newsList {
            let cellObjects = self.factory.buildNewsFeed(newsFeed: news)
            self.view?.configureView(cellObjects: cellObjects)
        }
    }
}


//MARK: - NewsFeedViewOutput

extension NewsFeedPresenter: NewsFeedViewOutput {
    
    func didTriggerViewReadyEvent() {
        self.firstLoadAndUpdateNewsListIfNeeded()
    }
    
}


//MARK: - MapModuleInput

extension NewsFeedPresenter: NewsFeedModuleInput {

}
