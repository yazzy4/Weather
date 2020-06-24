//
//  DetailVC.swift
//  WeatherApp
//
//  Created by Yaz Burrell on 6/23/20.
//  Copyright © 2020 Yaz Burrell. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temparatureLabel: UILabel!
    @IBOutlet weak var descpritionLabel: UILabel!
    
    var weatherReport: WeatherReport!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let weatherReport = weatherReport else { return }
        cityLabel.text = weatherReport.city
        temparatureLabel.text = weatherReport.degreesFarenheit
        descpritionLabel.text = weatherReport.conditions.first?.description
        weatherImageView.image = weatherReport.conditionImage
    }
   
 
    
}
