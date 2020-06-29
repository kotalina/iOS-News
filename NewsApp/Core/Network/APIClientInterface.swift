//
//  APIClientInterface.swift
//  NewsApp
//
//  Created by Алина Кошманова on 27.06.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation

protocol APIClient {
    
    func get(path: String,
             parameters: [String: Any]?,
             success: ((_ response: Any?) -> Void)?,
             failure: ((_ statusCode: Int, _ errorMessage: String?) -> Void)?)
    
    
    func post(path: String,
             parameters: [String: Any]?,
             success: ((_ response: Any?) -> Void)?,
             failure: ((_ statusCode: Int, _ errorMessage: String?) -> Void)?)
    
}
