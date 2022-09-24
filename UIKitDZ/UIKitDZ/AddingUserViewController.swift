//
//  AddingUserViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 24.09.22.
//

import UIKit
/// Controller for adding new user
final class AddingUserViewController: UIViewController {
    
    private lazy var logoImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var changeLogoButton = {
        let button = UIButton(configuration: .borderless())
        button.setTitle("Change photo", for: .normal)
        return button
    }()

    private lazy var nameLabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var nameTextField = {
        let textField = UITextField()
        textField.placeholder = "Enter name"
        return textField
    }()
    
    private lazy var dateLabel = {
        let label = UILabel()
        label.text = "Date"
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var dateTextField = {
        let textField = UITextField()
        textField.placeholder = "Enter date"
        return textField
    }()
    
    private lazy var ageLabel = {
        let label = UILabel()
        label.text = "Age"
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var ageTextField = {
        let textField = UITextField()
        textField.placeholder = "Add age"
        return textField
    }()
    
    private lazy var sexLabel = {
        let label = UILabel()
        label.text = "Sex"
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var sexTextField = {
        let textField = UITextField()
        textField.placeholder = "Choose"
        return textField
    }()
    
    private lazy var instagramLabel = {
        let label = UILabel()
        label.text = "Instagram"
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var instagramTextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your instagram account"
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(backAction(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(backAction(_:)))
        
        view.addSubview(logoImageView)
        logoImageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        logoImageView.center = view.center
        logoImageView.center.y -= 220
        logoImageView.image = UIImage(systemName: "person.circle.fill")
        
        view.addSubview(changeLogoButton)
        changeLogoButton.frame = CGRect(x: 0, y: 0, width: 200, height: 20)
        changeLogoButton.center = view.center
        changeLogoButton.center.y -= 100
        
        view.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: 20, y: 350, width: 100, height: 30)
        
        view.addSubview(nameTextField)
        nameTextField.frame = CGRect(x: 20, y: 380, width: 300, height: 30)
        nameTextField.addUnderLine()
        
        view.addSubview(dateLabel)
        dateLabel.frame = CGRect(x: 20, y: 420, width: 100, height: 30)
        
        view.addSubview(dateTextField)
        dateTextField.frame = CGRect(x: 20, y: 450, width: 300, height: 30)
        dateTextField.addUnderLine()
        
        view.addSubview(ageLabel)
        ageLabel.frame = CGRect(x: 20, y: 490, width: 100, height: 30)
        
        view.addSubview(ageTextField)
        ageTextField.frame = CGRect(x: 20, y: 520, width: 300, height: 30)
        ageTextField.addUnderLine()
        
        view.addSubview(sexLabel)
        sexLabel.frame = CGRect(x: 20, y: 560, width: 100, height: 30)
        
        view.addSubview(sexTextField)
        sexTextField.frame = CGRect(x: 20, y: 590, width: 300, height: 30)
        sexTextField.addUnderLine()
        
        view.addSubview(instagramLabel)
        instagramLabel.frame = CGRect(x: 20, y: 630, width: 100, height: 30)
        
        view.addSubview(instagramTextField)
        instagramTextField.frame = CGRect(x: 20, y: 660, width: 300, height: 30)
        instagramTextField.addUnderLine()
    }
    
    @objc func backAction(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}
