//
//  WeatherData.swift
//  DailyWeather
//
//  Created by Aditi Agrawal on 09/05/21.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let wind: Wind
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
    let humidity: Int
    let pressure: Int
}

struct Wind: Decodable {
    let speed: Double
}

struct Weather: Decodable {
    let id: Int
    let description: String
}
