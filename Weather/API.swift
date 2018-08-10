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
    
    
}
