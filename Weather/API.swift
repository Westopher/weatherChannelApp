//
//  API.swift
//  Weather
//
//  Created by West Kraemer on 8/9/18.
//  Copyright © 2018 West Kraemer. All rights reserved.
//

import Foundation

var weatherAPIEngine = WeatherAPIEngine(APIKey: "3a80c2c11df051a3")

class WeatherAPIEngine {
    
    var APIKey: String
    init(APIKey: String) { self.APIKey = APIKey }
    
    //parameters of function declared
    func fetchWeatherStatus(stateAbbreviation: String, cityName: String, APICompletionHandler: @escaping (_ condition: String, _ temperature: String, _ feelsLike: String, _ windSpeed: String, _ humidity: String, _ forecastURL: String) -> ()) {
        
    //creating the url to be called on at the API
        let urlString = "http://api.wunderground.com/api/" + APIKey + "/conditions/q/" + stateAbbreviation + "/" + cityName.replacingOccurrences(of: " ", with: "_") + ".json"
    
    //actually calling the API
        URLSession.shared.dataTask(with: URL(string: urlString)!, completionHandler: { (data, response, error) in
            
            guard let rawData = data, error == nil else { return }
            
            do {
                let JSONDataDictionary = try JSONSerialization.jsonObject(with: rawData) as? [String: Any]
            
            guard let currentObservationDictionary = JSONDataDictionary!["current_observation"] as? [String: Any] else { APICompletionHandler ("", "", "", "", "", "") ; return }
            
            let weatherConditionString = currentObservationDictionary["weather"] as! String
            let temperatureString = currentObservationDictionary["temperature_string"] as! String
            let feelsLikeString = currentObservationDictionary["feelslike_string"] as! String
            
            let windSpeedAsFloat = currentObservationDictionary["wind_gust_mph"] as? Float
            let windSpeedAsString = currentObservationDictionary["wind_gust_mph"] as? String
            let windSpeedString = windSpeedAsFloat == nil ? windSpeedAsString! : "\(windSpeedAsFloat!)"
            
            let humdityString = currentObservationDictionary["relative_humidity"] as! String
            let forecastURLString = currentObservationDictionary["forecast_url"] as! String
            
            APICompletionHandler(weatherConditionString, temperatureString, feelsLikeString, windSpeedString, humdityString, forecastURLString)
            }
            catch { APICompletionHandler("", "", "", "", "", "") }
            
        }).resume()
        
    }
    

}
