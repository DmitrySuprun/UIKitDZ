//
//  FoodViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 28.09.22.
//

import UIKit

// Food selection
final class FoodViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private lazy var pizzaButton = makeButton(title: "Pizza", yCoordinate: 166)
    private lazy var foodButton = makeButton(title: "Food", yCoordinate: 371)
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        title = "Food"
        view.backgroundColor = .white
        addView()
        addAction()
    }
    
    private func addView() {
        view.addSubview(pizzaButton)
        view.addSubview(foodButton)
    }
    
    private func addAction() {
        pizzaButton.addTarget(self, action: #selector(choosingListAction), for: .touchUpInside)
    }
    
    @objc private func choosingListAction() {
        let nextViewController = PizzaSelectionViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

// MARK: - Factory

private extension FoodViewController {
    
    func makeButton(title: String, yCoordinate: Int) -> UIButton {
        let button = UIButton(configuration: .borderedTinted())
        button.setTitle(title, for: .normal)
        button.frame = CGRect(x: 43, y: yCoordinate, width: 304, height: 135)
        return button
    }
}
