//
//  WeatherController.swift
//  Weather
//
//  Created by Jake Hardy on 2/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class WeatherController {
    
    static private let DEFAULT_URL = "http://api.openweathermap.org/data/2.5/weather?q="
    static private let DEFAULT_APPID = "&APPID=de2c7d1e59f2d3992d804550740b4b4d"
    
    static private func computeURLString(stringToCompute: String) -> String {
        var stringToReturn = ""
        for character in stringToCompute.characters {
            if character == " " {
                stringToReturn += "+"
            } else {
                stringToReturn += "\(character)"
            }
        }
        return stringToReturn
    }
    
    
    static func getWeather(searchString: String, completion: (weather: Weather?) -> Void) {
        let url = NSURL(string: DEFAULT_URL + computeURLString(searchString) + DEFAULT_APPID)!
        NetworkController.dataAtURL(url) { (returnedData) -> Void in
            // Check for data
            guard let data = returnedData else {
                completion(weather: nil)
                return
            }
            
            // If Data Exists; Serialize
            if let jsonObject = try? NSJSONSerialization.JSONObjectWithData(data, options: []),
                let jsonDictionary = jsonObject as? [String : AnyObject] {
                    let weather = Weather(jsonDictionary: jsonDictionary)
                    completion(weather: weather)
            }
            completion(weather: nil)
        }
    }
}