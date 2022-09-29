//
//  PaymentViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 29.09.22.
//

import UIKit

/// Choosing a payment method
class PaymentViewController: UIViewController {
    
    // MARK: - Public Properties
    
    var pizza: Pizza?
    weak var delegate: PopToRootDelegate?
    
    // MARK: - Private Properties
    
    private lazy var orderLabel = makeLabel(text: "Your order", yCoordinate: 161)
    private lazy var orderDescriptionLabel = makeLabel(text: "Order", yCoordinate: 215)
    private lazy var paymentCashLabel = makeLabel(text: "Payment with cash", yCoordinate: 597)
    private lazy var paymentCardLabel = makeLabel(text: "Payment with card", yCoordinate: 665)
    private lazy var paymentCashSwitch = makeSwitch(yCoordinate: 595)
    private lazy var paymentCardSwitch = makeSwitch(yCoordinate: 663)
    private lazy var payButton = makeButton()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        title = "Payment"
        view.backgroundColor = .white
        addView()
        setupOrderDescription()
        paymentCashSwitch.isOn = true
    }
    
    private func addView() {
        view.addSubview(orderLabel)
        view.addSubview(orderDescriptionLabel)
        view.addSubview(paymentCashLabel)
        view.addSubview(paymentCardLabel)
        view.addSubview(paymentCashSwitch)
        view.addSubview(paymentCardSwitch)
        view.addSubview(payButton)
    }
    
    private func setupOrderDescription() {
        var order = ""
        if let pizza = pizza {
            order += "\(pizza.name)\n"
            order += pizza.isMozzarella ? "+ Mozzarella\n" : ""
            order += pizza.isHum ? "+ Hum\n" : ""
            order += pizza.isMushrooms ? "+ Mushrooms\n" : ""
            order += pizza.isOlives ? "+ Olives\n" : ""
        }
        orderDescriptionLabel.numberOfLines = 0
        orderDescriptionLabel.frame = CGRect(x: 37, y: 215, width: 314, height: 183)
        orderDescriptionLabel.text = order
        orderDescriptionLabel.font = orderDescriptionLabel.font.withSize(30)
    }
    
    @objc func payAction() {
        guard paymentCardSwitch.isOn else { return }
        let alertController = UIAlertController(title: "Order has been paid",
                                                message: "Your order will be delivered\nwithin 15 minutes",
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default) {_ in
            self.dismiss(animated: false)
            self.delegate?.popRoot()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    @objc private func toggleCashCardSwitch(_ sender: UISwitch) {
        if paymentCardSwitch === sender {
            paymentCashSwitch.isOn.toggle()
        } else {
            paymentCardSwitch.isOn.toggle()
        }
    }
}

// MARK: - Factory

private extension PaymentViewController {
    
    func makeLabel(text: String, yCoordinate: Int) -> UILabel {
        let label = UILabel()
        label.text = text
        label.frame = CGRect(x: 37, y: yCoordinate, width: 190, height: 25)
        return label
    }
    
    func makeSwitch(yCoordinate: Int) -> UISwitch {
        let switchControl = UISwitch()
        switchControl.frame = CGRect(x: 302, y: yCoordinate, width: 51, height: 31)
        switchControl.addTarget(self, action: #selector(toggleCashCardSwitch), for: .valueChanged)
        return switchControl
    }
    
    func makeButton() -> UIButton {
        let button = UIButton(configuration: .filled())
        button.setTitle("  Pay", for: .normal)
        button.setImage(UIImage(systemName: "applelogo"), for: .normal)
        button.tintColor = .black
        button.frame = CGRect(x: 72, y: 732, width: 245, height: 53)
        button.addTarget(self, action: #selector(payAction), for: .touchUpInside)
        return button
    }
}
