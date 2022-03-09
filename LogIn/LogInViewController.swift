//
//  ViewController.swift
//  LogIn
//
//  Created by Anastasiia Korshina on 08.03.2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let userName = "korshina"
    private let password = "12345"

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard userNameTextField.text == userName &&
                passwordTextField.text == password else {
                    showAlert(
                        title: "Wrong User Name or Password",
                        message: "Enter correct User Name and Password"
                    )
                    return
                }
        if let welcomeVC = segue.destination as? WelcomeViewController {
            welcomeVC.welcomeGreeting += userName
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func forgotUserNameTapped() {
        showAlert(title: "Oops", message: "Your User Name is korshina")
    }

    @IBAction func forgotPasswordTapped() {
        showAlert(title: "Oops", message: "Your password is 12345")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue, sender: Any?) {
        if let logInVC = segue.destination as? LogInViewController {
            logInVC.userNameTextField.text = ""
            logInVC.passwordTextField.text = ""
        }
    }
    
}

extension LogInViewController {
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LogInViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .next {
            passwordTextField.becomeFirstResponder()
        } else {
            performSegue(withIdentifier: "showWelcomeScreen", sender: textField)
        }
        return true
    }
    
}
