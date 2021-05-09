//
//  WeatherManager.swift
//  DailyWeather
//
//  Created by Aditi Agrawal on 09/05/21.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric"
    var delegate: WeatherManagerDelegate?
    
    
    // MARK: -  Prepare Request URL

    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)&appid=\(K.weatherApiKey)"
        performRequest(with: urlString)
    }
    
    
    // MARK: -  Network Call

    func performRequest(with urlString: String) {
        // Create a URL
        guard let url = URL(string: urlString) else { return }
        // Give session a task
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if error != nil {
                print("Error requesting weather data \(error.debugDescription)")
                self.delegate?.didFailWithError(error: error!)
                return
            }
            if let safeData = data {
                if let weather = self.parseJson(weatherData: safeData) {
                    delegate?.didUpdateWeather(weatherManager: self, weather: weather)
                }
            }
        })
        // Start a task
        task.resume()
    }
    
    // MARK: -  Parsing JSON
    
    func parseJson(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let weather = WeatherModel(weatherId: decodedData.weather[0].id, temperature: decodedData.main.temp, cityName: decodedData.name, windSpeed: decodedData.wind.speed, pressure: decodedData.main.pressure, humidity: decodedData.main.humidity, weatherDesc: decodedData.weather[0].description)
            return weather
        } catch {
            print("Error parsing the data \(error)")
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
