//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 21.09.22.
//

import UIKit

final class FindNumberViewController: UIViewController {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello: "
        label.textAlignment = .center
        label.frame = CGRect(x: 20, y: 80, width: 200, height: 25)
        label.backgroundColor = .systemGray
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        return label
    }()
    
    private lazy var additionButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("Addition", for: .normal)
        button.setTitle("pressed", for: .highlighted)
        button.frame = CGRect(x: 20, y: 160, width: 100, height: 40)
        button.addTarget(self, action: #selector(additionAction(paramTarget:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.frame = CGRect(x: 140, y: 160, width: 100, height: 40)
        label.text = "Result: "
        return label
    }()
    
    private var hiddenNumber = 0
    
    private lazy var findNumberButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("Find number", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.frame = CGRect(x: 20, y: 240, width: 100, height: 50)
        button.addTarget(self, action: #selector(findNumberAction(paramTarget:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var findNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Let's try to guess the number"
        textField.frame = CGRect(x: 20, y: 320, width: 250, height: 40)
        textField.isHidden = true
        return textField
    }()
    
    private lazy var tryButton: UIButton = {
        let button =  UIButton(configuration: .filled())
        button.setTitle("Try", for: .normal)
        button.frame = CGRect(x: 20, y: 400, width: 100, height: 40)
        button.isHidden = true
        button.addTarget(self, action: #selector(tryToFindNumberAction(paramTarget:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
    
    @objc func additionAction(paramTarget: UIButton) {
        let additionAlertController = UIAlertController(title: "Addition",
                                                        message: "Enter two value",
                                                        preferredStyle: .alert)
        
        additionAlertController.addTextField()
        additionAlertController.addTextField()
        
        let resultAlertAction = UIAlertAction(title: "Result", style: .default) { _ in
            guard let result = additionAlertController.textFields?.reduce(0, { $0 + (Int($1.text ?? "") ?? 0) })
            else { return }
            self.resultLabel.text = "Result: \(result)"
        }
        
        additionAlertController.addAction(resultAlertAction)
        self.present(additionAlertController, animated: true)
    }
    
    @objc func findNumberAction(paramTarget: UIButton) {
        tryButton.isHidden = false
        findNumberTextField.isHidden = false
        findNumberTextField.text = ""
        hiddenNumber = Int.random(in: 0...100)
        print(hiddenNumber)
    }
    
    @objc func tryToFindNumberAction(paramTarget: UIButton) {
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
