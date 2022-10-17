//
//  StackViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 16.10.22.
//

import UIKit

// Layout with StackView
final class StackViewController: UIViewController {
    // MARK: Visual Components
    private lazy var redView = makeView(.systemRed)
    private lazy var yellowView = makeView(.systemYellow)
    private lazy var greenView = makeView(.systemGreen)
    private lazy var trafficLightStackView = makeStackView()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        calculateMarginTrafficLightStackView()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        view.addSubview(trafficLightStackView)
    }
    
    private func addConstraints() {
        trafficLightStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            trafficLightStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
            trafficLightStackView.widthAnchor.constraint(equalTo: trafficLightStackView.heightAnchor, multiplier: 1/3),
            trafficLightStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            trafficLightStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func calculateMarginTrafficLightStackView() {
        let marginSize = view.frame.height / 50
        trafficLightStackView.spacing = marginSize
        trafficLightStackView.layoutMargins = UIEdgeInsets(top: marginSize,
                                                           left: marginSize,
                                                           bottom: marginSize,
                                                           right: marginSize)
        trafficLightStackView.isLayoutMarginsRelativeArrangement = true
    }
}

// MARK: - Factory
private extension StackViewController {
    func makeView(_ withColor: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = withColor
        return view
    }
    
    func makeStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [
            redView,
            yellowView,
            greenView
        ])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.backgroundColor = .label
        return stackView
    }
}
