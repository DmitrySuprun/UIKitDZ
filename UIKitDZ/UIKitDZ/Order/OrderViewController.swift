//
//  OrderViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 27.09.22.
//

import UIKit
/// Address entry. Purchase confirmation
final class OrderViewController: UIViewController {
    
    // MARK: - Public Properties
    
    var product: Product?
    var currentColor: Int?
    let sizes = ["S", "M", "L", "XL"]
    
    // MARK: - Private Properties
    
    private lazy var productImageView = makeProductImage()
    private lazy var addressLabel = makeLabel(text: "Address", yCoordinate: 420)
    private lazy var addressTextField = makeTextField(placeholder: "Enter address", yCoordinate: 450)
    private lazy var countLabel = makeLabel(text: "Count", yCoordinate: 480)
    private lazy var countTextField = makeTextField(text: "1", yCoordinate: 510)
    private lazy var sizeLabel = makeLabel(text: "Size", yCoordinate: 540)
    private lazy var sizeTextField = makeTextField(placeholder: "Choose size", yCoordinate: 570)
    private lazy var countSlider = makeSlider()
    private lazy var confirmButton = makeConfirmButton()
    private lazy var sizePicker = makePicker()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sizePicker.delegate = self
        sizePicker.dataSource = self
        title = "Cart"
        setupUI()
    }
    
    // MARK: - Public Methods
    
    @objc func closePickerAction() {
        view.endEditing(true)
    }
    
    @objc func sliderStepAction(_ sender: UISlider) {
        let newValue = sender.value.rounded()
        sender.setValue(Float(newValue), animated: true)
    }
    
    @objc func filledCountTextFieldAction(_ sender: UISlider) {
        let newValue = Int(sender.value.rounded())
        countTextField.text = "\(newValue)"
    }
    
    @objc func confirmationAction() {
        let message = """
                      Address: \(addressTextField.text ?? "")
                      Count: \(countTextField.text ?? "1")
                      Size: \(sizeTextField.text ?? "")
                      """
        let alertController = UIAlertController(title: "Order", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        let imageView = UIImageView()
        let imageName = product?.images[currentColor ?? 0]
        imageView.image = UIImage(named: imageName ?? "")
        imageView.frame = CGRect(x: 20, y: 40, width: 40, height: 40)
        imageView.contentMode = .scaleAspectFit
        alertController.view.addSubview(imageView)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}

// MARK: - SetupUI

extension OrderViewController {
    
    func setupUI() {
        view.backgroundColor = .white
        addView()
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closePickerAction))
        view.addGestureRecognizer(gestureRecognizer)
        productImageView.center = view.center
        productImageView.center.y -= 180
        countTextField.isEnabled = false
        sizeTextField.inputView = sizePicker         // Где лучше настроить inputView? в Factory не вариант
        confirmButton.center = view.center
        confirmButton.center.y += 250
    }
    
    func addView() {
        view.addSubview(productImageView)
        view.addSubview(addressLabel)
        view.addSubview(addressTextField)
        view.addSubview(countLabel)
        view.addSubview(countTextField)
        view.addSubview(sizeLabel)
        view.addSubview(sizeTextField)
        view.addSubview(countSlider)
        view.addSubview(confirmButton)
    }
}

// MARK: - Factory

private extension OrderViewController {
    
    func makeProductImage() -> UIImageView {
        let imageView = UIImageView()
        if let imageName = product?.images[currentColor ?? 0] {
            imageView.image = UIImage(named: imageName)
        }
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    func makeLabel(text: String, yCoordinate: Int) -> UILabel {
        let label = UILabel()
        label.text = text
        label.frame = CGRect(x: 20, y: yCoordinate, width: 200, height: 25)
        return label
    }
    
    func makeTextField(text: String? = nil, placeholder: String? = nil, yCoordinate: Int) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.text = text
        textField.frame = CGRect(x: 20, y: yCoordinate, width: 200, height: 25)
        return textField
    }
    
    func makeSlider() -> UISlider {
        let slider = UISlider()
        slider.frame = CGRect(x: 150, y: 510, width: 210, height: 25)
        slider.minimumValue = 1
        slider.maximumValue = 5
        slider.addTarget(self, action: #selector(sliderStepAction(_:)), for: .touchUpInside)
        slider.addTarget(self, action: #selector(filledCountTextFieldAction(_:)), for: .valueChanged)
        return slider
    }
    
    func makeConfirmButton() -> UIButton {
        let button = UIButton(configuration: .filled())
        button.setTitle("Confirm", for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(confirmationAction), for: .touchUpInside)
        return button
    }
    
    func makePicker() -> UIPickerView {
        let picker = UIPickerView()
        return picker
    }
}

// MARK: - UIPickerViewDataSource

extension OrderViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        sizes.count
    }
}

// MARK: - UIPickerViewDelegate

extension OrderViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        sizes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sizeTextField.text = sizes[row]
    }
}
