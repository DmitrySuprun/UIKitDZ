//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 21.09.22.
//

import UIKit

// Checking login/password
final class LoginViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var logoImageView = makeImage()
    private lazy var emailLabel = makeLabel(text: "Email", yCoordinate: 330)
    private lazy var emailTextField = makeTextField(placeholder: "Enter email", yCoordinate: 363)
    private lazy var passwordLabel = makeLabel(text: "Password", yCoordinate: 406)
    private lazy var passwordTextField = makeTextField(placeholder: "Enter password", yCoordinate: 439)
    private lazy var loginButton = makeButton()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        addView()
        setupTextField()
        setupView()
    }
    
    private func addView() {
        view.addSubview(logoImageView)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }
    
    private func setupTextField() {
        emailTextField.keyboardType = .numberPad
        passwordTextField.isSecureTextEntry = true
    }
    
    private func setupView() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func loginAction() {
        let nextViewController = FoodViewController()
        let navigationViewController = UINavigationController(rootViewController: nextViewController)
        navigationViewController.modalTransitionStyle = .flipHorizontal
        navigationViewController.modalPresentationStyle = .fullScreen
        present(navigationViewController, animated: true)
    }
}

// MARK: - Factory

private extension LoginViewController {
    
    func makeImage() -> UIImageView {
        let imageView = UIImageView()
        let image = UIImage(named: "Logo")
        imageView.image = image
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.frame = CGRect(x: 120, y: 100, width: 150, height: 200)
        return imageView
    }
    
    func makeLabel(text: String, yCoordinate: Int) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .systemBlue
        label.frame = CGRect(x: 56, y: yCoordinate, width: 77, height: 35)
        return label
    }
    
    func makeTextField(placeholder: String, yCoordinate: Int) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.frame = CGRect(x: 56, y: yCoordinate, width: 280, height: 35)
        textField.addUnderLine()
        return textField
    }
    
    func makeButton() -> UIButton {
        let button = UIButton(configuration: .filled())
        button.setTitle("Login", for: .normal)
        button.frame = CGRect(x: 56, y: 572, width: 280, height: 42)
        button.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return button
    }
}
