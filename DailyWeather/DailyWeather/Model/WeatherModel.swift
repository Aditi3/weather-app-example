//
//  WeatherModel.swift
//  DailyWeather
//
//  Created by Aditi Agrawal on 09/05/21.
//

struct WeatherModel {
    
    let weatherId: Int
    let temperature: Double
    let cityName: String
    let windSpeed: Double
    let pressure: Int
    let humidity: Int
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
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
