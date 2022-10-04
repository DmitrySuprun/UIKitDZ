//
//  ReadingNowViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 4.10.22.
//

import UIKit

// Recently read and recommendation
class ReadingNowViewController: UIViewController {
    
    // MARK: - Private Properties
    private lazy var newBookButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("Read", for: .normal)
        button.addTarget(self, action: #selector(pushBoolAction), for: .touchUpInside)
        button.sizeToFit()
        return button
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Properties
    private func setupUI() {
        addViews()
        newBookButton.center = view.center
    }
    
    private func addViews() {
        view.addSubview(newBookButton)
    }
    
    // MARK: - Objc Private Properties
    @objc private func pushBoolAction() {
        let nextViewController = ReaderViewController()
        present(nextViewController, animated: true)
    }
}
