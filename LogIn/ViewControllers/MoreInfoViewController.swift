//
//  MoreInfoViewController.swift
//  LogIn
//
//  Created by Anastasiia Korshina on 13.03.2022.
//

import UIKit

class MoreInfoViewController: UIViewController {
    
    @IBOutlet var personImage: UIImageView!
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        personImage.image = UIImage(named: user.person.image)
    }
    
}
