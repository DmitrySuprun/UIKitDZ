//
//  IngredientsViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 29.09.22.
//

import UIKit

/// Pop to rootViewController in Navigation Stack
protocol PopToRootDelegate: AnyObject {
    func popRoot()
}

/// Choice of additional ingredients
class IngredientsViewController: UIViewController, PopToRootDelegate {
    
    // MARK: - Public Properties
    
    var pizza: Pizza?
    
    // MARK: - Private Properties
    
    private lazy var titleLabel = makeLabel(text: pizza?.name ?? "", yCoordinate: 13)
    private lazy var mozzarellaLabel = makeLabel(text: "Mozzarella", yCoordinate: 444)
    private lazy var humSwitchLabel = makeLabel(text: "Hum", yCoordinate: 503)
    private lazy var mushroomsLabel = makeLabel(text: "Mushroom", yCoordinate: 571)
    private lazy var olivesLabel = makeLabel(text: "Olives", yCoordinate: 639)
    private lazy var mozzarellaCheeseSwitch = makeSwitch(yCoordinate: 429)
    private lazy var humSwitchSwitch = makeSwitch(yCoordinate: 488)
    private lazy var mushroomsSwitch = makeSwitch(yCoordinate: 556)
    private lazy var olivesSwitch = makeSwitch(yCoordinate: 624)
    private lazy var pizzaImageView = makeImageView()
    private lazy var orderButton = makeButton()
    private lazy var infoButton = makeInfoButton()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Public Methods
    
    func popRoot() {
        self.view.isHidden = true
        dismiss(animated: false)
        if let presentingRootViewController = presentingViewController as? UINavigationController {
            presentingRootViewController.popToRootViewController(animated: false)
        }
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        view.backgroundColor = .white
        addView()
        setupTitleLabel()
    }
    
    private func addView() {
        view.addSubview(titleLabel)
        view.addSubview(mozzarellaLabel)
        view.addSubview(humSwitchLabel)
        view.addSubview(mushroomsLabel)
        view.addSubview(olivesLabel)
        view.addSubview(mozzarellaCheeseSwitch)
        view.addSubview(humSwitchSwitch)
        view.addSubview(mushroomsSwitch)
        view.addSubview(olivesSwitch)
        view.addSubview(pizzaImageView)
        view.addSubview(makeButton())
        view.addSubview(infoButton)
    }
    
    private func setupTitleLabel() {
        titleLabel.center.x = view.center.x
        titleLabel.textAlignment = .center
        titleLabel.font = titleLabel.font.withSize(48)
        titleLabel.sizeToFit()
    }
    
    private func updateModelAction() {
        pizza?.isMozzarella = mozzarellaCheeseSwitch.isOn
        pizza?.isHum = humSwitchSwitch.isOn
        pizza?.isMushrooms = mushroomsSwitch.isOn
        pizza?.isOlives = olivesSwitch.isOn
    }
    
    @objc private func pushPaymentViewControllerAction() {
        updateModelAction()
        let viewController = PaymentViewController()
        viewController.pizza = pizza
        viewController.delegate = self
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalTransitionStyle = .flipHorizontal
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
    
    @objc private func caloriesAction() {
        let caloriesViewController = CaloriesViewController()
        present(caloriesViewController, animated: true)
    }
}

// MARK: - Factory

private extension IngredientsViewController {
    
    func makeLabel(text: String, yCoordinate: Int) -> UILabel {
        let label = UILabel()
        label.text = text
        label.frame = CGRect(x: 37, y: yCoordinate, width: 190, height: 25)
        return label
    }
    
    func makeSwitch(yCoordinate: Int) -> UISwitch {
        let switchControl = UISwitch()
        switchControl.frame = CGRect(x: 302, y: yCoordinate, width: 0, height: 0)
        switchControl.sizeToFit()
        return switchControl
    }
    
    func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        let image = UIImage(named: pizza?.image ?? "")
        imageView.image = image
        imageView.frame = CGRect(x: 64, y: 103, width: 262, height: 262)
        imageView.backgroundColor = .systemGray6
        return imageView
    }
    
    func makeButton() -> UIButton {
        let button = UIButton(configuration: .filled())
        button.setTitle("Order", for: .normal)
        button.frame = CGRect(x: 72, y: 692, width: 245, height: 53)
        button.addTarget(self, action: #selector(pushPaymentViewControllerAction), for: .touchUpInside)
        return button
    }
    
    func makeInfoButton() -> UIButton {
        let button = UIButton(configuration: .borderless())
        button.setImage(UIImage(systemName: "info.circle"), for: .normal)
        button.addTarget(self, action: #selector(caloriesAction), for: .touchUpInside)
        button.frame = CGRect(x: 324, y: 20, width: 40, height: 40)
        return button
    }
}
