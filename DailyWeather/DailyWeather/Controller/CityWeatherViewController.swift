//
//  ViewController.swift
//  DailyWeather
//
//  Created by Aditi Agrawal on 08/05/21.
//

import UIKit

class CityWeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var weatherDesc: UILabel!
    
    var cityName: String?
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherManager.delegate = self
        requestCityWeatherDetails()
    }
    
    func requestCityWeatherDetails() {
        if self.cityName == "" {
            weatherManager.fetchWeather(cityName: K.defaultCity)
        } else {
            weatherManager.fetchWeather(cityName: self.cityName ?? K.defaultCity)
        }
    }
}

// MARK: - WeatherManagerDelegate

extension CityWeatherViewController: WeatherManagerDelegate {
   
    func didUpdateWeather(weatherManager: WeatherManager, weather: WeatherModel) {
        let weather = weather as WeatherModel
        DispatchQueue.main.async {
            
            self.temperatureLabel.text = weather.temperatureString + "°"
            self.cityLabel.text = weather.cityName
            self.weatherDesc.text = weather.weatherDescription
            self.windLabel.text = weather.windString + "km/h"
            self.humidityLabel.text = weather.humidity.description + "%"
            self.pressureLabel.text = weather.pressure.description + "mb"
            self.conditionImageView.image = UIImage(systemName: weather.weatherConditionName)
        }
    }
    
    func didFailWithError(error: Error) {
        print("Error handling data \(error)")
    }
}

