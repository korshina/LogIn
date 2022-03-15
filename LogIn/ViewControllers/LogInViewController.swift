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
    
    private let user = User.getUser()

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController,
              let viewControllers = tabBarController.viewControllers else { return }
        
//        tabBarItems.last?.title = "\(user.person.fullName)"
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                if let infoVC = navigationVC.topViewController as? InfoViewController {
                    infoVC.user = user
                }
            }
        }

    }
    
    // MARK: IBActions
    
    @IBAction func logInButtonTapped() {
        guard userNameTextField.text == user.login, passwordTextField.text == user.password else {
            showAlert(
                title: "Неправильный логин или пароль",
                message: "Введите правильный логин и пароль",
                textField: passwordTextField)
            return }
        
        performSegue(withIdentifier: "showWelcomeScreen", sender: nil)
    }
    
    @IBAction func forgotButtonsTapped(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Ой!", message: "Ваш логин \(user.login)")
        : showAlert(title: "Ой!", message: "Ваш пароль \(user.password)")
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
