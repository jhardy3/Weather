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

    // MARK: - Fetching Data with URL
    
    static func dataAtURL(url: NSURL, completion: (returnedData: NSData?) -> Void) {
        let dataTask = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, _, error) -> Void in
            if let error = error {
                print(error.description)
            }
            completion(returnedData: data)
        }
        dataTask.resume()
    }
}