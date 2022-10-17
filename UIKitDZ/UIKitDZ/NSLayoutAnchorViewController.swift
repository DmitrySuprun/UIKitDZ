//
//  NSLayoutAnchorViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 21.09.22.
//

import UIKit

// Layout with NSLayoutAnchor
final class NSLayoutAnchorViewController: UIViewController {
    // MARK: Visual Components
    private lazy var redView = makeView(.systemRed)
    private lazy var yellowView = makeView(.systemYellow)
    private lazy var greenView = makeView(.systemGreen)
    private lazy var containerView = makeView(.label)
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        view.addSubview(containerView)
        view.addSubview(redView)
        view.addSubview(yellowView)
        view.addSubview(greenView)
    }
    
    private func addConstraints() {
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        redView.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        yellowView.widthAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        
        redView.heightAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
        redView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
        redView.centerYAnchor.anchorWithOffset(to: yellowView.centerYAnchor)
            .constraint(equalTo: yellowView.heightAnchor, multiplier: 1.1).isActive = true
        redView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        
        greenView.heightAnchor.constraint(equalTo: greenView.widthAnchor).isActive = true
        greenView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
        greenView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        greenView.centerYAnchor.anchorWithOffset(to: yellowView.centerYAnchor)
            .constraint(equalTo: yellowView.heightAnchor, multiplier: -1.1).isActive = true
        greenView.centerYAnchor.constraint(equalToSystemSpacingBelow: yellowView.centerYAnchor,
                                           multiplier: 1.45).isActive = true
        
        containerView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: yellowView.centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: yellowView.widthAnchor, multiplier: 1.2).isActive = true
        containerView.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 2.85).isActive = true
    }
}

// MARK: - Factory
private extension NSLayoutAnchorViewController {
    func makeView(_ withColor: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = withColor
        return view
    }
}
