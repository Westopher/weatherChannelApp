//
//  ViewController.swift
//  Weather
//
//  Created by West Kraemer on 8/7/18.
//  Copyright © 2018 West Kraemer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//User Inputs (labels and text boxes)
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var infoFrameView: UIView!
    @IBOutlet weak var locationLabel: UILabel!

//StackView
    @IBOutlet weak var conditionsLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
//Error Labels
    @IBOutlet weak var noInforeturnedLabel: UILabel!
    @IBOutlet weak var checkCityAndStateNamesLabel: UILabel!

//User Inputs

    // Button 1
    @IBAction func getCurrentWeather(_ sender: Any) {
        view.endEditing(true)
        if stateTextField.text!.characters.count != 2 || cityTextField.text == "" { return }

//Activity Indicator
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.activityIndicatorViewStyle = .whiteLarge
        activityIndicatorView.center = CGPoint(x: view.center.x, y: view.center.y)
        activityIndicatorView.color = UIColor.black
        activityIndicatorView.startAnimating()
        view.addSubview(activityIndicatorView)
        infoFrameView.alpha = 0
        noInforeturnedLabel.alpha = 0
        checkCityAndStateNamesLabel.alpha = 0
        
        weatherAPIEngine.fetchWeatherStatus(stateAbbreviation: stateTextField.text!, cityName: cityTextField.text!) { (conditions, temperature, feelsLike, windSpeed, humidity, forcastURL) in
            DispatchQueue.main.sync {
                activityIndicatorView.stopAnimating()
                activityIndicatorView.removeFromSuperview()
                self.noInforeturnedLabel.alpha = 1
                self.checkCityAndStateNamesLabel.alpha = 1
                
                if conditions == "" { self.infoFrameView.alpha = 0 ; return }
                self.infoFrameView.alpha = 1
                self.locationLabel.text = self.cityTextField.text! + ", " +
                self.stateTextField.text!
                self.conditionsLabel.text = "Conditions: " + conditions
                self.tempLabel.text = "Temp: " + temperature
                self.feelsLikeLabel.text = "Feels like: " + feelsLike
                self.windLabel.text = "Wind: " + windSpeed + "mph"
                self.humidityLabel.text = "Humidity: " + humidity
                self.forecastURLString = forcastURL
            }
        }
        
    }
    
    // Button 2
    @IBAction func getForecast(_ sender: Any) {
        if forecastURLString == nil || forecastURLString == "" { return }
        UIApplication.shared.open(URL(string: forecastURLString)!, options: [:], completionHandler: nil)
        
    }

    var forecastURLString: String!
    
    override func viewDidLoad() { super.viewDidLoad() }

    override func viewWillAppear(_ animated: Bool) {
        infoFrameView.alpha = 0
        noInforeturnedLabel.alpha = 0
        checkCityAndStateNamesLabel.alpha = 0
        
    }
}

