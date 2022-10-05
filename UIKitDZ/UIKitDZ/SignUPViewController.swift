//
//  SignUPViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 3.10.22.
//

import UIKit

/// Checking login/password
final class SignUPViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        addNotification()
    }
    
    // MARK: - Public Methods
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let name = nameTextField.text else { return false }
        guard let password = passwordTextField.text else { return false }
        if let user = UserDefaults.standard.string(forKey: name) {
            alertAction(text: "\(user) already exist")
            return false
        }
        UserDefaults.standard.set(password, forKey: name)
        return true
    }
    
    // MARK: - Private Methods
    private func setupTextFields() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case nameTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        default:
            passwordTextField.resignFirstResponder()
        }
    }
    
    private func addNotification() {
//        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
//                                               object: nil, queue: nil) {_ in
//            self.view.frame.origin.y -= 50
//        }
//        NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification,
//                                               object: nil, queue: nil) {_ in
//            self.view.frame.origin.y += 50
//        }
    }
    
    private func alertAction(text: String) {
        let alertController = UIAlertController(title: text,
                                                message: "Try again",
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension SignUPViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switchBasedNextTextField(textField)
        return true
    }
}
