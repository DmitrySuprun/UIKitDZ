//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 21.09.22.
//

import UIKit

final class ViewController: UIViewController {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello: "
        label.textAlignment = .center
        label.frame = CGRect(x: 20, y: 80, width: 200, height: 25)
        label.backgroundColor = .systemGray
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        return label
    }()
    
    let additionButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("Addition", for: .normal)
        button.setTitle("pressed", for: .highlighted)
        button.frame = CGRect(x: 20, y: 160, width: 100, height: 40)
        return button
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.frame = CGRect(x: 140, y: 160, width: 100, height: 40)
        label.text = "Result: "
        return label
    }()
    
    private var hiddenNumber = 0
    
    let findNumberButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("Find number", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.frame = CGRect(x: 20, y: 240, width: 100, height: 50)
        return button
    }()
    
    let findNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Let's try to guess the number"
        textField.frame = CGRect(x: 20, y: 320, width: 250, height: 40)
        textField.isHidden = true
        return textField
    }()
    
    let tryButton: UIButton = {
        let button =  UIButton(configuration: .filled())
        button.setTitle("Try", for: .normal)
        button.frame = CGRect(x: 20, y: 400, width: 100, height: 40)
        button.isHidden = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - FIXMI найти правильное место для объявления target
        additionButton.addTarget(self, action: #selector(addition(paramTarget:)), for: .touchUpInside)
        findNumberButton.addTarget(self, action: #selector(findNumber(paramTarget:)), for: .touchUpInside)
        tryButton.addTarget(self, action: #selector(tryToFindNumber(paramTarget:)), for: .touchUpInside)
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        alertIntro()
    }
    
    func setupUI() {
        view.addSubview(nameLabel)
        view.addSubview(additionButton)
        view.addSubview(resultLabel)
        view.addSubview(findNumberButton)
        view.addSubview(findNumberTextField)
        view.addSubview(tryButton)
    }
    
    func alertIntro() {
        let greetingAlertController = UIAlertController(title: "Hello",
                                                        message: "Enter your name",
                                                        preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "ok", style: .default) { _ in
            self.nameLabel.text? += greetingAlertController.textFields?.first?.text ?? ""
        }
        greetingAlertController.addTextField()
        greetingAlertController.addAction(okAlertAction)
        self.present(greetingAlertController, animated: true)
    }
    
    @objc func addition(paramTarget: UIButton) {
        let additionAlertController = UIAlertController(title: "Addition",
                                                        message: "Enter two value",
                                                        preferredStyle: .alert)
        additionAlertController.addTextField()
        additionAlertController.addTextField()
        let resultAlertAction = UIAlertAction(title: "Result", style: .default) { _ in
            guard let firstTerm = Int(additionAlertController.textFields?[0].text ?? "") else { return }
            guard let secondTerm = Int(additionAlertController.textFields?[1].text ?? "") else { return }
            self.resultLabel.text? = "Result: " + String(firstTerm + secondTerm)
        }
        additionAlertController.addAction(resultAlertAction)
        self.present(additionAlertController, animated: true)
    }
    
    @objc func findNumber(paramTarget: UIButton) {
        self.tryButton.isHidden = false
        self.findNumberTextField.isHidden = false
        self.findNumberTextField.text = ""
        self.hiddenNumber = Int.random(in: 0...100)
        print(hiddenNumber)
    }
    
    @objc func tryToFindNumber(paramTarget: UIButton) {
        guard let enteredNumber = Int(findNumberTextField.text ?? "") else { return }
        switch enteredNumber {
        case hiddenNumber:
            findNumberTextField.text = "You win!!!"
            findNumberTextField.isHidden = false
            tryButton.isHidden = false
        case ...hiddenNumber:
            findNumberTextField.text = "More"
        case hiddenNumber...:
            findNumberTextField.text = "Less"
        default: break
        }
    }
}
