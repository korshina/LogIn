//
//  WelcomeViewController.swift
//  LogIn
//
//  Created by Anastasiia Korshina on 08.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradient()
        guard let user = user else { return }
        welcomeLabel.text = "Приветствую, \(user.person.name) \(user.person.surname)!"
    }
    
    
    private func setGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.frame
        gradientLayer.colors = [
            UIColor(red: 252/255, green: 77/255, blue: 130/255, alpha: 1).cgColor,
            UIColor(red: 1, green: 208/255, blue: 107/255, alpha: 1).cgColor
        ]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    

}
