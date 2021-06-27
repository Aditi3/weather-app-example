//
//  ViewController.swift
//  DailyWeather
//
//  Created by Aditi Agrawal on 08/05/21.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var weatherDescLabel: UILabel!
    
    var cityName: String?
    private var weatherManager = WeatherManager()
    
    
    // MARK: - Controller Life Cycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherManager.delegate = self
        /// Request to fetch the Weather Details
        requestCityWeatherDetails()
    }
    
    // MARK: - Request Weather Details for the City
    
    func requestCityWeatherDetails() {
        if self.cityName == "" {
            weatherManager.fetchWeather(cityName: K.defaultCity)
        } else {
            weatherManager.fetchWeather(cityName: self.cityName ?? K.defaultCity)
        }
    }
}

// MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    
    /// Defining this Weather Manager method makes ViewController conform/adopt
    /// the WeatherManagerDelegate protocol. This method is called
    /// when the weather detail is fetched successfully.
    func didUpdateWeather(weatherManager: WeatherManager, weather: WeatherModel) {
        let weather = weather as WeatherModel
        DispatchQueue.main.async {
            /// Set View Elements, temperature, city name, description, humidity,  pressure and condition Image
            self.temperatureLabel.text = weather.temperatureString + "°"
            self.cityNameLabel.text = weather.cityName
            self.weatherDescLabel.text = weather.weatherDescription
            self.windLabel.text = weather.windSpeedString + "km/h"
            self.humidityLabel.text = weather.humidity.description + "%"
            self.pressureLabel.text = weather.pressure.description + "mb"
            self.conditionImageView.image = UIImage(systemName: weather.weatherConditionName)
        }
    }
    
    /// Defining this Weather Manager method makes ViewController conform/adopt
    /// the WeatherManagerDelegate protocol. This method is called
    /// when the weather detail is fetched request is failed.
    func didFailWithError(error: Error) {
        print("Error handling data \(error)")
    }
}

