//
//  WelcomeViewController.swift
//  LogIn
//
//  Created by Anastasiia Korshina on 08.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var userName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradient()
        welcomeLabel.text = "Welcome, \(userName)!"
    }
    
    
    private func setGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.frame
        gradientLayer.colors = [
            UIColor.systemBlue.cgColor,
            UIColor.systemMint.cgColor
        ]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    

}
