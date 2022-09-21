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
    
    var findNumberButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - FIXMI найти правильное место
        additionButton.addTarget(self, action: #selector(addition(paramTarget:)), for: .touchUpInside)
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        alertIntro()
    }
    
    func setupUI() {
        view.addSubview(nameLabel)
        view.addSubview(additionButton)
        view.addSubview(resultLabel)
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
}
