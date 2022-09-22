//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 21.09.22.
//

import UIKit

final class ViewController: UIViewController {
    
    let reversedLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 40, width: 200, height: 40)
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        return label
    }()
    
    let startButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("Begin", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.center = view.center
        startButton.addTarget(self, action: #selector(startGame(paramTarget:)), for: .touchUpInside)
    }
    
    @objc func startGame(paramTarget: UIButton) {
        let getWordAlertController = UIAlertController(title: "New game", message: "Enter any word:", preferredStyle: .alert)
        getWordAlertController.addTextField()
        let okAlertAction = UIAlertAction(title: "Ok", style: .default)
        getWordAlertController.addAction(okAlertAction)
    }
}
