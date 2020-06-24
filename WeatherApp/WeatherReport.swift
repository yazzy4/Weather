//
//  WeatherReport.swift
//  WeatherApp
//
//  Created by Yaz Burrell on 6/24/20.
//  Copyright © 2020 Yaz Burrell. All rights reserved.
//

import Foundation

struct WeatherReport: Decodable {
    let city: String
    let weatherDetails: WeatherReportDetails
    let conditions: [WeatherCondition]
    
    private enum CodingKeys: String, CodingKey {
        case city = "name"
        case weatherDetails = "main"
        case conditions = "weather"
    }
}

struct WeatherReportDetails: Decodable {
    let temp: Double 
}

struct WeatherCondition: Decodable {
    let id: Int
    let description: String
}
