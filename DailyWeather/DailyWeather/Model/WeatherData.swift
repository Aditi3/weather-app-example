//
//  WeatherData.swift
//  DailyWeather
//
//  Created by Aditi Agrawal on 09/05/21.
//

import Foundation

struct WeatherData: Decodable {
    var name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    var temp: Double
    var humidity: Int
    var pressure: Int
}

struct Weather: Decodable {
    var description: String
}
