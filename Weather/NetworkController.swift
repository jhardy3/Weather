//
//  NetworkController.swift
//  Weather
//
//  Created by Jake Hardy on 2/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class NetworkController {
    
    // MARK: - Private URL Computation
    static private let DEFAULT_URL = "http://api.openweathermap.org/data/2.5/weather?q="
    static private let DEFAULT_APPID = "&APPID=de2c7d1e59f2d3992d804550740b4b4d"
    static private var searchTerm = ""
    
    // Computed Generic URL
    static private var URL: NSURL? {
        if searchTerm.isEmpty != true {
            return NSURL(string: DEFAULT_URL + searchTerm + DEFAULT_APPID)
        } else {
            return nil
        }
    }
    
    // Adds "+" to string where spaces are prevalent
    static func setSearchTerm(searchTerm: String) {
        self.searchTerm = ""
        for character in searchTerm.characters {
            if character != " " {
                self.searchTerm += "\(character)"
            } else {
                self.searchTerm += "+"
            }
        }
    }
    
    // MARK: - Fetching Data with URL
    
    static func dataAtURL(completion: (returnedData: NSData?) -> Void) {
        guard let url = self.URL else {
            return
        }
        let dataTask = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, _, error) -> Void in
            if let error = error {
                print(error.description)
            }
            completion(returnedData: data)
        }
        dataTask.resume()
    }
}