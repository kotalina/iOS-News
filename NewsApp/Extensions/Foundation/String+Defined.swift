//
//  String+Defined.swift
//  NewsApp
//
//  Created by Алина Кошманова on 27.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation

extension String {
    
    //MARK: - Constants
    static let empty = ""
    
    
    //MARK: - Defined Strings
   
    enum Bundle {
        static let httpPrefix = "http://"
        static let apiKey = "fc1c70dd752f4bfc9bdf1491f85be4dd"
        
    }
    
    enum ScreenTitles {
        static let newsFeed = "Лента новостей"
    }
    
    enum NetworkError {
        static let internet = "Ошибка Интернет-соединения. Попробуйте еще раз."
        static let unknown = "Ошибка. Попробуйте еще раз."
    }
    
    enum DateFormat {
        static let fullDate = "HH:mm d MMM yyyy"
        static let dateForGettingNewsRequest = "yyyy-MM-dd"
    }
    
    enum Alert {
        
        enum ActionTitle {
            static let ok = "Ок"
        }
    }
    
    enum Resources {
        
        enum Names {
           static let indicatorLoader = "IndicatorLoader"
        }
        
        enum Application {
            static let json = "json"
        }

    }
    
}
