//
//  WeatherViewController.swift
//  Weather
//
//  Created by Jake Hardy on 2/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    // MARK: - Outlet Properties
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateWith(weather: Weather?) {
        guard let weather = weather, let temp = weather.temperatureC else { return }
        cityLabel.text = weather.cityName
        temperatureLabel.text = String(temp)
        mainLabel.text = weather.main
    }
    
}


extension WeatherViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            return
        }
        WeatherController.getWeather(text) { (weather) -> Void in
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.updateWith(weather)
            })
        }

        
    }
    
    
}
