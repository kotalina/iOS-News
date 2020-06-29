//
//  BaseTableViewCell.swift
//  NewsApp
//
//  Created by Алина Кошманова on 27.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import UIKit

protocol BaseTableViewCell {
    func configureWith(cellObject: BaseTableViewCellObject)
}
