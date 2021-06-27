//
//  WeatherManager.swift
//  DailyWeather
//
//  Created by Aditi Agrawal on 09/05/21.
//

import Foundation

/// WeatherManager DELEGATE PROTOCOL
protocol WeatherManagerDelegate: AnyObject {
    /// Give callback when Weather Manager network call is successful
    func didUpdateWeather(weatherManager: WeatherManager, weather: WeatherModel)
    /// Give callback when Weather Manager network call fails
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric"
    // delegate variable create for protocol
    weak var delegate: WeatherManagerDelegate?
    
    // MARK: -  Prepare Request URL
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)&appid=\(K.weatherApiKey)"
        performRequest(with: urlString)
    }
    
    // MARK: -  Request Weather API
    
    /// Fetch the Weather Details for provided city
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
                    /// Calls protocol weather data fetch is successful
                    self.delegate?.didUpdateWeather(weatherManager: self, weather: weather)
                }
            }
        })
        // Start a task
        task.resume()
    }
    
    // MARK: -  Parsing JSON
    
    /// Parse the Weather Detail JSON
    ///
    /// - Parameters:
    ///   - WeatherModel: returns weather detail
    func parseJson(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let weather = WeatherModel(weatherId: decodedData.weather[0].id,
                                       temperature: decodedData.main.temp,
                                       cityName: decodedData.name,
                                       windSpeed: decodedData.wind.speed,
                                       pressure: decodedData.main.pressure,
                                       humidity: decodedData.main.humidity,
                                       description: decodedData.weather[0].weatherDescription)
            return weather
        } catch {
            /// prints the parsing error and calls protocol `didFailWithError`
            print("Error parsing the data \(error)")
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
