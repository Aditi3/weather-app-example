//
//  WeatherManager.swift
//  DailyWeather
//
//  Created by Aditi Agrawal on 09/05/21.
//

import Foundation


struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=64aca4e110e5a524cc13faaaf78d909f&units=metric"
    
    func fetchWeather(cityName: String) {
        
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // Create a URL
        guard let url = URL(string: urlString) else { return }
        
        // Give session a task
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if error != nil {
                print("Error requesting weather data \(error.debugDescription)")
                return
            }
            if let safeData = data {
                self.parseJson(weatherData: safeData)
            }
        })
        
        // Start a task
        task.resume()
    }
    
    func parseJson(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.name)
            print(decodedData.main.temp)
            print(decodedData.main.humidity)
            print(decodedData.main.pressure)
            print(decodedData.weather[0].description)
        } catch {
            
        }
    }
}
