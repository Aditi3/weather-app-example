//
//  WeatherData.swift
//  DailyWeather
//
//  Created by Aditi Agrawal on 09/05/21.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let wind: Wind
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let humidity: Int
    let pressure: Int
}

struct Wind: Codable {
    let speed: Double
}

struct Weather: Codable {
    let id: Int
    let description: String
}
