//
//  ReadingNowViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 4.10.22.
//

import UIKit
// MARK: - Constant
private extension ReadingNowViewController {
    enum Constant {
        static let titleButton = "Read"
    }
}

// Recently read and recommendation
final class ReadingNowViewController: UIViewController {
    
    // MARK: - Private Properties
    private lazy var newBookButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle(Constant.titleButton, for: .normal)
        button.addTarget(self, action: #selector(pushBoolAction), for: .touchUpInside)
        button.sizeToFit()
        button.center = view.center
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
