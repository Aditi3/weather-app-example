//
//  ViewController.swift
//  DailyWeather
//
//  Created by Aditi Agrawal on 08/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var weatherManager = WeatherManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        requestCityWeatherDetails()
    }
    
    func requestCityWeatherDetails() {
        
        weatherManager.fetchWeather(cityName: "Berlin")
    }


}

