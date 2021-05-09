//
//  WeatherManager.swift
//  DailyWeather
//
//  Created by Aditi Agrawal on 09/05/21.
//

import Foundation


struct WeatherManager {
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather?appid=64aca4e110e5a524cc13faaaf78d909f&units=metric"
    
    
    func fetchWeather(cityName: String) {
        
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        
    }
}
