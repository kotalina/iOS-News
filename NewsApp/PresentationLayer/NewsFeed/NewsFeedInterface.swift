//
//  NewsFeedInterface.swift
//  NewsApp
//
//  Created by Алина Кошманова on 28.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import UIKit

protocol NewsFeedViewInput {
    func configureView(cellObjects: [BaseTableViewCellObject])
    func showErrorAlert(title: String)
    func needHideLoaderIndicator(needHide: Bool)
}

protocol NewsFeedViewOutput {
    func didTriggerViewReadyEvent()
}

protocol NewsFeedModuleOutput {
}

protocol NewsFeedModuleInput {
}
