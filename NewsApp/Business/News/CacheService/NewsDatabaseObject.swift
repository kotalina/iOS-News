//
//  NewsDatabaseObject.swift
//  NewsApp
//
//  Created by Алина Кошманова on 28.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import RealmSwift

class NewsDatabaseObject: Object {
    
    //MARK: - Properties
    @objc dynamic var url = String.empty
    @objc dynamic var data = NSData()
    
    convenience init(url: String, data: NSData) {
        self.init()
        self.url = url
        self.data = data
    }
    
    override class func primaryKey() -> String? {
        return "url"
    }
    
}
