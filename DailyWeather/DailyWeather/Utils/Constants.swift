//
//  Constants.swift
//  DailyWeather
//
//  Created by Aditi Agrawal on 09/05/21.
//

struct K {
    
    static let AppName = "DailyWeather"
    static let HomePageTitle = "Today's Weather"
    static let DefaultCity = "Mumbai"
    
    struct API {
        static let weatherApiKey = "64aca4e110e5a524cc13faaaf78d909f"
        static let weatherApiURL = "https://api.openweathermap.org/data/2.5/weather?units=metric"
    }
    
    struct SegueIdentifier {
        static let weatherPage = "goToWeather"
    }
    
}
