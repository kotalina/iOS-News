//
//  NewsFeedTableViewManager.swift
//  NewsApp
//
//  Created by Алина Кошманова on 27.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import UIKit

class NewsFeedTableViewManager: NSObject {
    
    //MARK: Properties
    private var tableView: UITableView?
    private var cellObjects: [BaseTableViewCellObject]?
    
    //MARK: - Incapsulation
    
    func set(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.register(UITableViewCell.nibFor(reuseIdentifier: UITableViewCell.ReuseIdentifier.News.newsItem), forCellReuseIdentifier: UITableViewCell.ReuseIdentifier.News.newsItem)
    }
    
    //MARK: Functions
    
    func updateWith(cellObjects: [BaseTableViewCellObject]) {
        self.cellObjects = cellObjects
        self.tableView?.reloadData()
    }
    
    func reloadData() {
        self.tableView?.reloadData()
    }
    
}


//MARK: UITableViewDataSource

extension NewsFeedTableViewManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellObject = self.cellObjects?[indexPath.row] else {
            return UITableViewCell()
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.ReuseIdentifier.News.newsItem, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configureWith(cellObject: cellObject)
        
        return cell
    }
    
}


//MARK: UITableViewDelegate

extension NewsFeedTableViewManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cellObjects?[indexPath.row].height() ?? 0
    }
    
}
