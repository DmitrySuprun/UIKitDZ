//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 21.09.22.
//

import UIKit
/// Controller for checking login and password
final class LoginViewController: UIViewController {
    
    private lazy var contentSignInView = {
        let view = UIView()
        return view
    }()
    
    private lazy var logoLabel = {
        let label = UILabel()
        label.layer.borderWidth = 2
        label.text = "Birthday Remainder"
        label.textColor = .systemBlue
        label.textAlignment = .center
        return label
    }()
    
    private lazy var signInLogoLabel = {
        let label = UILabel()
        label.text = "Sign in"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    private lazy var emailLabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .systemRed
        return label
    }()
    
    private lazy var loginTextField = {
        let textField = UITextField()
        textField.placeholder = "example@email.com"
        return textField
    }()
    
    private lazy var passwordLabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .systemRed
        return label
    }()
    
    private lazy var passwordTextField = {
        let textField = UITextField()
        textField.placeholder = "Enter password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var faceIDLabel = {
        let label = UILabel()
        label.text = "Use Face ID"
        return label
    }()
    
    private lazy var faceIDSwitch = {
        let switchID = UISwitch()
        return switchID
    }()
    
    private lazy var signInButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("Sign in", for: .normal)
        button.addTarget(self, action: #selector(verifyPasswordAction(_:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func verifyPasswordAction(_ sender: UIButton) {
        guard loginTextField.text == "111" && passwordTextField.text == "111" && !faceIDSwitch.isOn
        else { return }
        let birthdayListViewController = BirthdayListViewController()
        self.navigationController?.pushViewController(birthdayListViewController, animated: true)
    }
    
    func setupUI() {
        
        view.addSubview(logoLabel)
        logoLabel.frame = CGRect(x: 0, y: 0, width: 170, height: 100)
        logoLabel.center = view.center
        logoLabel.center.y -= 250
        
        view.addSubview(contentSignInView)
        contentSignInView.frame = CGRect(x: 0, y: 0, width: view.frame.width / 1.3, height: view.frame.height / 2.5)
        contentSignInView.center = view.center
        
        let ySpacingSubviews = contentSignInView.frame.height / 8
        let xLeadingSpacing = CGFloat(10)

        contentSignInView.addSubview(signInLogoLabel)
        signInLogoLabel.frame = CGRect(x: xLeadingSpacing, y: ySpacingSubviews / 2, width: 170, height: 30)

        contentSignInView.addSubview(emailLabel)
        emailLabel.frame = CGRect(x: xLeadingSpacing, y: 2 * ySpacingSubviews, width: 170, height: 30)

        contentSignInView.addSubview(loginTextField)
        loginTextField.frame = CGRect(x: xLeadingSpacing,
                                      y: 3 * ySpacingSubviews,
                                      width: contentSignInView.frame.width - (2 * xLeadingSpacing),
                                      height: 30)
        loginTextField.addUnderLine()

        contentSignInView.addSubview(passwordLabel)
        passwordLabel.frame = CGRect(x: xLeadingSpacing, y: 4 * ySpacingSubviews, width: 170, height: 30)

        contentSignInView.addSubview(passwordTextField)
        passwordTextField.frame = CGRect(x: xLeadingSpacing,
                                         y: 5 * ySpacingSubviews,
                                         width: contentSignInView.frame.width - (2 * xLeadingSpacing),
                                         height: 30)
        passwordTextField.addUnderLine()
        
        // MARK: - FIXMI alignment
        contentSignInView.addSubview(faceIDLabel)
        faceIDLabel.frame = CGRect(x: xLeadingSpacing, y: 6 * ySpacingSubviews, width: 170, height: 30)
        
        contentSignInView.addSubview(faceIDSwitch)
        faceIDSwitch.frame = CGRect(x: (contentSignInView.bounds.maxX - xLeadingSpacing - faceIDSwitch.bounds.width),
                                    y: 6 * ySpacingSubviews,
                                    width: 0,
                                    height: 0)
        
        contentSignInView.addSubview(signInButton)
        signInButton.frame = CGRect(x: xLeadingSpacing,
                                    y: 7 * ySpacingSubviews,
                                    width: contentSignInView.frame.width - (2 * xLeadingSpacing),
                                    height: 30)
    }
}

extension UITextField {
    func addUnderLine() {
        let underLine = CALayer()
        underLine.frame = CGRect(x: 0.0, y: self.bounds.height + 3, width: self.bounds.width, height: 1.5)
        underLine.backgroundColor = UIColor.systemGray4.cgColor
        self.layer.addSublayer(underLine)
    }
}
