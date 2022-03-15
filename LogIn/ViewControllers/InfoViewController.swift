//
//  InfoViewController.swift
//  LogIn
//
//  Created by Anastasiia Korshina on 13.03.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var familyStatusLabel: UILabel!
    @IBOutlet weak var placeOfWorkLabel: UILabel!
    @IBOutlet weak var hobbiesLabel: UILabel!
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()        
    }

//     MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let moreInfoVC = segue.destination as? MoreInfoViewController {
            moreInfoVC.user = user
        }
    }
    
    private func setView() {
        title = "\(user.person.fullName)"
        
        dateOfBirthLabel.text = user.person.dateOfBirth
        adressLabel.text = user.person.adress
        familyStatusLabel.text = user.person.familyStatus
        placeOfWorkLabel.text = user.person.placeOfWork
        hobbiesLabel.text = user.person.hobbies
    }


}
