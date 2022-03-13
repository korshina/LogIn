//
//  InfoViewController.swift
//  LogIn
//
//  Created by Anastasiia Korshina on 13.03.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet var descriptionLabel: UILabel!
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = user else { return }
        navigationItem.title = "\(user.person.name) \(user.person.surname)"
        descriptionLabel.text = user.person.description
    }
    


//     MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let moreInfoVC = segue.destination as? MoreInfoViewController {
            moreInfoVC.user = user
        }
    }


}
