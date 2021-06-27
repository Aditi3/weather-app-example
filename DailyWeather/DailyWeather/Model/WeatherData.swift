//
//  WeatherData.swift
//  DailyWeather
//
//  Created by Aditi Agrawal on 09/05/21.
//

import Foundation


// MARK: - Weather Datum

struct WeatherData: Codable {
    let name: String
    let main: Main
    let wind: Wind
    let weather: [Weather]
}


// MARK: - Main
struct Main: Codable {
    let temp: Double
    let pressure, humidity: Int
}


// MARK: - Wind

struct Wind: Codable {
    let speed: Double
}


// MARK: - Weather

struct Weather: Codable {
    let id: Int
    let weatherDescription: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case weatherDescription = "description"
    }
}


