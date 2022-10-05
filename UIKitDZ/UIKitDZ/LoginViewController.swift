//
//  LoginViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 5.10.22.
//

import UIKit

// MARK: - Constants
private extension LoginViewController {
    enum Constant {
        static let alertWrongEmailMessage = "Wrong email"
        static let alertWrongPasswordMessage = "Wrong password"
        static let alertTryAgainMessage = "Try again"
        static let alertOkMessage = "Ok"
    }
}

/// Checking Login
final class LoginViewController: UIViewController {
    // MARK: - IBAction
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Public Properties
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let password = UserDefaults.standard.string(forKey: loginTextField.text ?? "") else {
            alertAction(text: Constant.alertWrongEmailMessage)
            return false }
        guard password == passwordTextField.text else {
            alertAction(text: Constant.alertWrongPasswordMessage)
            return false }
        return true
    }
    
    // MARK: - Private Properties
    private func alertAction(text: String) {
        let alertController = UIAlertController(title: text,
                                                message: Constant.alertTryAgainMessage,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: Constant.alertOkMessage, style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
