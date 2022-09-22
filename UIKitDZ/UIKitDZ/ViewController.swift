//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 21.09.22.
//

import UIKit

final class ViewController: UIViewController {
    
    private var model = ConvertStringModel()
    
    private lazy var reversedLabel: UILabel = {
        let label = UILabel()
        label.text = "Convert string"
        label.sizeToFit()
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        return label
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("Begin", for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(startGame(paramTarget:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(reversedLabel)
        view.addSubview(startButton)
        startButton.center = view.center
        reversedLabel.center = startButton.center
        reversedLabel.center.y -= 40
    }
    
    @objc func startGame(paramTarget: UIButton) {
        let getWordAlertController = UIAlertController(title: "New game",
                                                       message: "Enter any word:",
                                                       preferredStyle: .alert)
        getWordAlertController.addTextField()
        let okAlertAction = UIAlertAction(title: "Ok", style: .default) {_ in
            self.model.originalString = getWordAlertController.textFields?.first?.text ?? ""
            self.reversedLabel.text = self.model.convertedString
            // Обработка layout reversedLabel после ввода нового текста
            self.reversedLabel.sizeToFit()
            self.reversedLabel.center.x = self.view.center.x
        }
        getWordAlertController.addAction(okAlertAction)
        self.present(getWordAlertController, animated: true)
    }
}
