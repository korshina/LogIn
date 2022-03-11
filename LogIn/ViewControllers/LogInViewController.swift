//
//  ViewController.swift
//  LogIn
//
//  Created by Anastasiia Korshina on 08.03.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: Properties
    
    private let userName = "korshina"
    private let password = "12345"

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let welcomeVC = segue.destination as? WelcomeViewController {
            welcomeVC.userName = userName
        }
        
    }
    
    // MARK: IBActions
    
    @IBAction func logInButtonTapped() {
        guard userNameTextField.text == userName, passwordTextField.text == password else {
            showAlert(
                title: "Wrong User Name or Password",
                message: "Enter correct User Name and Password",
                textField: passwordTextField)
            return }
        
        performSegue(withIdentifier: "showWelcomeScreen", sender: nil)
    }
    
    @IBAction func forgotButtonsTapped(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops", message: "Your User Name is \(userName)")
        : showAlert(title: "Oops", message: "Your password is \(password)")
    }
       
    @IBAction func unwind(for segue: UIStoryboardSegue, sender: Any?) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
}

// MARK: AlertController

extension LogInViewController {
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if let textField = textField {
                textField.text = ""
            }
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: Keyboard
extension LogInViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .next {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButtonTapped()
        }
        return true
    }
    
}
