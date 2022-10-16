//
//  NSLayoutConstraintsViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 15.10.22.
//

import UIKit
// Layout with NSLayoutConstraints
final class NSLayoutConstraintsViewController: UIViewController {
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
        view.translatesAutoresizingMaskIntoConstraints = false
        redView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: yellowView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 1).isActive = true
        NSLayoutConstraint(item: yellowView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 1).isActive = true
        NSLayoutConstraint(item: yellowView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .height,
                           multiplier: 0.2,
                           constant: 1).isActive = true
        NSLayoutConstraint(item: yellowView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .height,
                           multiplier: 1,
                           constant: 1).isActive = true
        
        NSLayoutConstraint(item: redView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: redView,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: redView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: redView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerY,
                           multiplier: 0.55,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: redView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: greenView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: greenView,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: greenView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: greenView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: greenView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerY,
                           multiplier: 1.45,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: containerView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: containerView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: containerView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .width,
                           multiplier: 1.2,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: containerView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: containerView,
                           attribute: .width,
                           multiplier: 2.85,
                           constant: 0).isActive = true
    }
}

// MARK: - Factory
private extension NSLayoutConstraintsViewController {
    func makeView(_ withColor: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = withColor
        return view
    }
}
