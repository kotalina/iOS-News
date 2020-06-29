//
//  Date+Helpers.swift
//  NewsApp
//
//  Created by Алина Кошманова on 27.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation

extension Date {
   
    //MARK: - DateFormat functions
    
    func dateToString(dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let dateString = dateFormatter.string(from: self)
        
        return dateString
    }
    
    func dateToFullTimeString() -> String {
        let dateString = self.dateToString(dateFormat: String.DateFormat.fullDate)
        return dateString
    }
    
}
