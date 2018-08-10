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

//User Inputs (buttons)
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
        
    }
    
    @IBAction func getForecast(_ sender: Any) {
    }
    
    override func viewDidLoad() { super.viewDidLoad() }


}

