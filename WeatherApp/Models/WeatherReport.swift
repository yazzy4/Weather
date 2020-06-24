//
//  WeatherReport.swift
//  WeatherApp
//
//  Created by Yaz Burrell on 6/24/20.
//  Copyright © 2020 Yaz Burrell. All rights reserved.
//

import UIKit

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


extension WeatherReport {
    var degreesFarenheit: String {
        
        let wholeTemperature = Int(weatherDetails.temp)
        
        let degreesFarenheit = String(wholeTemperature) + "˚"
        
        return degreesFarenheit
    }
    
    var conditionImage: UIImage {
        
        guard let mainCondition = conditions.first else { return UIImage() }
        
        switch mainCondition.id {
        case 200...299: return UIImage(named:"thunder") ?? UIImage()
        case 300...399: return UIImage(named:"drizzle") ?? UIImage()
        case 500...599: return UIImage(named:"heavyRain") ?? UIImage()
        case 600...699: return UIImage(named:"snow") ?? UIImage()
        case 700...799: return UIImage(named:"fog") ?? UIImage()
        case 800      : return UIImage(named:"sunny") ?? UIImage()
        case 801...899: return UIImage(named:"cloudy") ?? UIImage()
            default: return UIImage()
            
            
        }
    }
}

