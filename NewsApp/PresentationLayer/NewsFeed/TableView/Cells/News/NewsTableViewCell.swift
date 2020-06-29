//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Алина Кошманова on 27.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import UIKit


class NewsTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsAuthorLabel: UILabel!
    @IBOutlet weak var newsDateLabel: UILabel!
    @IBOutlet weak var separatorView: UIView!
    
    
    // MARK: - Lifecycle functions
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.configureView()
    }
    
    // MARK: - Configure functions
    
    private func configureView() {
        
        //Fonts
        self.newsTitleLabel.font = UIFont.optimaRegular(size: 14)
        self.newsAuthorLabel.font = UIFont.optimaRegular(size: 13)
        self.newsDateLabel.font = UIFont.optimaRegular(size: 13)
        
        //Colors
        self.newsTitleLabel.textColor = UIColor.black
        self.newsAuthorLabel.textColor =  UIColor.purChemColor()
        self.newsDateLabel.textColor = UIColor.jazzColor()
        self.separatorView.backgroundColor = UIColor.raisinBlackColor()
    }
    
}


//MARK: - BaseTableViewCell extension

extension NewsTableViewCell: BaseTableViewCell {
    
    func configureWith(cellObject: BaseTableViewCellObject) {
        
        if let newsObject = cellObject as? NewsTableViewCellObject {
            
            self.newsTitleLabel.text = newsObject.title
            self.newsAuthorLabel.text = newsObject.author
            
            
            if let date = newsObject.date {
                self.newsDateLabel.text = date.dateToFullTimeString()
                
            }
        }
    }

}
