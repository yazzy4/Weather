//
//  ViewController.swift
//  WeatherApp
//
//  Created by Yaz Burrell on 6/22/20.
//  Copyright © 2020 Yaz Burrell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    API Key:e6e8b6f5f8c32e7ecb47ab3e8623ecb0
//  https://samples.openweathermap.org/data/2.5/weather?q=London&id=2172797&appid=e6e8b6f5f8c32e7ecb47ab3e8623ecb0&units=imperial

    
    @IBOutlet weak var cityTextField: UITextField!
    @IBAction func didTapGoButton(){
        
        var components = URLComponents(string: "https://api.openweathermap.org/data/2.5/weather?")
        
        let cityQuery = URLQueryItem(name: "q", value: cityTextField.text)
        let appIDQuery = URLQueryItem(name: "appid", value: "e6e8b6f5f8c32e7ecb47ab3e8623ecb0")
        let unitsQuery = URLQueryItem(name: "units", value: "imperial")
        
        components?.queryItems = [cityQuery, appIDQuery, unitsQuery]
//        print(components?.queryItems)
        
        guard let url = components?.url else { return }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, _ , error) in

            if let error = error {
                print(error.localizedDescription)

            } else if let data = data{
                
                do {
//                    let json = try JSONSerialization.jsonObject(with: data, options: [])
//                    print(json)
                    
                    let weatherReport = try JSONDecoder().decode(WeatherReport.self, from: data)
                    print(weatherReport)
                    
                } catch  {
                    print(error)
                }
            }
        }
        dataTask.resume()
        
//        performSegue(withIdentifier: "segue.main.enterCityToWeather", sender: nil)
//
    }

    @IBAction func returnToMainVC(_ sender: UIStoryboardSegue){
        
    }

}

