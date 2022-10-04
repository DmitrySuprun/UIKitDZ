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
    
    // MARK: - Public Properties
    var checkingUser: ((User) -> (Bool))?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        addNotification()
    }
    
    // MARK: - IBAction
    @IBAction func signUpAction(_ sender: Any) {
        let user = User(name: nameTextField.text ?? "",
                        email: emailTextField.text ?? "",
                        password: passwordTextField.text ?? "")
    }
        
    // MARK: - Private Properties
    private func setupTextFields() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func addNotification() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil, queue: nil) {_ in
            self.view.frame.origin.y -= 150
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil, queue: nil) {_ in
            self.view.frame.origin.y += 150
        }
    }
}

extension SignUPViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            nameTextField.resignFirstResponder()
            emailTextField.becomeFirstResponder()
            return true
        case 1:
            emailTextField.resignFirstResponder()
            return true
        default: return true
        }
    }
}
