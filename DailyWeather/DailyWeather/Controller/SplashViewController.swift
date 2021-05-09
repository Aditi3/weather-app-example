//
//  LaunchViewController.swift
//  DailyWeather
//
//  Created by Aditi Agrawal on 09/05/21.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var appNameLabel: UILabel!
    var index = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        performAppLaunchAnimation()
    }
    
    
    func performAppLaunchAnimation() {
        
        let appName = "🔆 Daily Weather"
        for letter in appName {
            Timer.scheduledTimer(withTimeInterval: 0.2 * index, repeats: false) { timer in
                self.appNameLabel.text?.append(letter)
            }
            self.index += 1
        }
        
    }
}
