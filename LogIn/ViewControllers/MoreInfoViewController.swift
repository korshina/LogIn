//
//  MoreInfoViewController.swift
//  LogIn
//
//  Created by Anastasiia Korshina on 13.03.2022.
//

import UIKit

class MoreInfoViewController: UIViewController {
    
    @IBOutlet var personImage: UIImageView!
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = user else { return }
        personImage.image = user.person.image
    }
    
}
