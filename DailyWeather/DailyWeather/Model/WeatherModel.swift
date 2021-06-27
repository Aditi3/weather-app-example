//
//  WeatherModel.swift
//  DailyWeather
//
//  Created by Aditi Agrawal on 09/05/21.
//

import Foundation

struct WeatherModel {
    
    let weatherId: Int
    let temperature: Double
    let cityName: String
    let windSpeed: Double
    let pressure: Int
    let humidity: Int
    let description: String
    
    /// Returns Wind Speed in String format
    var windSpeedString: String {
        return String(format: "%.f", round(windSpeed))
    }
    
    /// Returns Temperature in String format
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    /// Returns Weather Description in String format
    var weatherDescription: String {
        return description.capitalizingFirstLetter()
    }
    
    /// Returns Weather Condition Name
    var weatherConditionName: String {
        switch weatherId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...532:
            return "cloud.rain"
        case 600...632:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}


// MARK: - String Extension

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
