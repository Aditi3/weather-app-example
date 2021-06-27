//
//  SelectCityViewController.swift
//  DailyWeather
//
//  Created by Aditi Agrawal on 09/05/21.
//

import UIKit

class EnterCityViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var appNameLabel: UILabel!
    
    var index = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTextField.delegate = self
        performAppNameLabelAnimation()
    }
    
    func performAppNameLabelAnimation() {
        let appName = "DailyWeather"
        for letter in appName {
            Timer.scheduledTimer(withTimeInterval: 0.1 * index, repeats: false) { timer in
                self.appNameLabel.text?.append(letter)
            }
            self.index += 1
        }
    }
    
    // MARK: Segue Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWeather" {
            if let weatherVC = segue.destination as? CityWeatherViewController {
                weatherVC.cityName = cityTextField.text
            }
        }
    }
    
    // MARK: Actions
    
    @IBAction func buttonGoTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "goToWeather", sender: self)
    }
}

// MARK: - UITextFieldDelegate

extension EnterCityViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
