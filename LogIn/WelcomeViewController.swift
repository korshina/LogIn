//
//  WelcomeViewController.swift
//  LogIn
//
//  Created by Anastasiia Korshina on 08.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var welcomeGreeting = "Welcome, "

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradient()
        welcomeLabel.text = welcomeGreeting + "!"
    }
    
    
    private func setGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.frame
        gradientLayer.colors = [
            UIColor.yellow.cgColor,
            UIColor.orange.cgColor
        ]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    

}
