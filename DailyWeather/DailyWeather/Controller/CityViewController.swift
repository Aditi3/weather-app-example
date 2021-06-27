//
//  SelectCityViewController.swift
//  DailyWeather
//
//  Created by Aditi Agrawal on 09/05/21.
//

import UIKit

class CityViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var appNameLabel: UILabel!
    
    /// [This property is] to update the index counter, we will using for App Name Animation
    private var index = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Conform Text Field Delegate to self
        self.cityTextField.delegate = self
        /// Add Animation to the App Name Display
        performAppNameLabelAnimation()
    }
    
    func performAppNameLabelAnimation() {
        for letter in K.AppName {
            Timer.scheduledTimer(withTimeInterval: 0.1 * index, repeats: false) { timer in
                /// Append the App Name Letters
                self.appNameLabel.text?.append(letter)
            }
            self.index += 1
        }
    }
    
    // MARK: - Segue Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.SegueIdentifier.weatherPage {
            if let weatherVC = segue.destination as? WeatherViewController {
                /// This passes the city name to the Weather View Controller
                weatherVC.cityName = cityTextField.text
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction func buttonGoTapped(_ sender: Any) {
        self.performSegue(withIdentifier: K.SegueIdentifier.weatherPage, sender: self)
    }
}

// MARK: - UITextFieldDelegate

extension CityViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        /// Hides the TextField 
        textField.resignFirstResponder()
        return true
    }
}
