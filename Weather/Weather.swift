//
//  Weather.swift
//  Weather
//
//  Created by Jake Hardy on 2/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class Weather {
    // MARK: - Keys
    
    private let kMain = "main"
    private let kDescription = "description"
    private let kWeather = "weather"
    private let kIconString = "icon"
    private let kTemperatureK = "temp"
    private let kCityName = "name"
    
    
    // MARK: - Properties
    
    var main: String = ""
    var description: String = ""
    var iconString: String = ""
    var iconImage: UIImage?
    var temperatureK: Float?
    var cityName: String = ""
    
    // Computed Properties
    var temperatureC: Double? {
        if let temperatureK = temperatureK {
            return Double(temperatureK - 273.15)
        }
        return nil
    }
    
    // MARK: - Initialization
    
    init?(jsonDictionary: [String : AnyObject]) {
        guard let weatherArray = jsonDictionary[kWeather] as? [[String : AnyObject]],
            let mainDictionary = jsonDictionary[kMain] as? [String: AnyObject],
            let main = weatherArray[0][kMain] as? String,
            let description = weatherArray[0][kDescription] as? String,
            let iconString = weatherArray[0][kIconString] as? String,
            let temperatureK = mainDictionary[kMain] as? Float,
            let cityName = jsonDictionary[kCityName] as? String else {
                return nil
        }
        self.main = main
        self.description = description
        self.iconString = iconString
        self.temperatureK = temperatureK
        self.cityName = cityName
    }
    
    
    
    
    
}



