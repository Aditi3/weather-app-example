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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTextField.layer.cornerRadius = 3.0
        cityTextField.delegate = self
    }
    
    @IBAction func buttonGoTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "goToWeather", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWeather" {
            if let weatherVC = segue.destination as? CityWeatherViewController {
                weatherVC.cityName = cityTextField.text
            }
        }
    }    
}

extension EnterCityViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
