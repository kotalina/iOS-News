//
//  NewsFeedViewController.swift
//  NewsApp
//
//  Created by Алина Кошманова on 27.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import UIKit
import Lottie

class NewsFeedViewController: UIViewController {
    
    //MARK: - Outlets
    var newsTableView: UITableView!
    var animationView: AnimationView!
    
    //MARK: - Properties
    private var output: NewsFeedViewOutput?
    private var manager = NewsFeedTableViewManager()

    
    //MARK: - Incapsulation
    
    func set(output: NewsFeedViewOutput) {
        self.output = output
    }
    
    //MARK: - Lifecylce functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
        self.configureTableViewManager()
        
        self.output?.didTriggerViewReadyEvent()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.configureNavigationController()
    }
    
    
    //MARK: - Configurating function
    
    private func configureView() {
        
        self.newsTableView = UITableView(frame: self.view.frame)
        self.newsTableView.separatorStyle = .none
        self.view.addSubview(self.newsTableView)
        self.configureAnimationView()
        self.needHideLoaderIndicator(needHide: false)
        
    }
    
    private func configureTableViewManager() {
        self.manager.set(tableView: self.newsTableView)
        self.newsTableView.delegate = self.manager
        self.newsTableView.dataSource = self.manager
    }
    
    private func configureAnimationView() {
        let path = Bundle.main.path(forResource: String.Resources.Names.indicatorLoader,
                                    ofType: String.Resources.Application.json) ?? String.empty
        
        self.animationView = AnimationView(filePath: path)
        self.animationView.loopMode = .loop
        self.animationView.play()
        self.animationView.frame = CGRect(x: self.view.center.x - 30,
                                          y: self.view.center.y - 30,
                                          width: 60,
                                          height: 60)
        self.view.addSubview(self.animationView)
    }
    
    private func configureNavigationController() {
        self.title = String.ScreenTitles.newsFeed
    }
    
}

extension NewsFeedViewController: NewsFeedViewInput {
    
    func configureView(cellObjects: [BaseTableViewCellObject]) {
        self.manager.updateWith(cellObjects: cellObjects)
    }
    
    func showErrorAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: String.Alert.ActionTitle.ok, style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    func needHideLoaderIndicator(needHide: Bool) {
        
        if needHide {
            self.animationView.stop()
        } else {
            self.animationView.play()
        }
        
    }
}

