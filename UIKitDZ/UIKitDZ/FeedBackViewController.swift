//
//  FeedBackViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 30.09.22.
//

import UIKit
/// Feedback
class FeedBackViewController: UIViewController {
    
    // Private Properties
    
    private lazy var feedBackSlider = {
        let slider = UISlider()
        slider.frame = CGRect(x: 20, y: 510, width: 370, height: 25)
        slider.minimumValue = 1
        slider.maximumValue = 5
        slider.addTarget(self, action: #selector(sliderStepAction(_:)), for: .touchUpInside)
        slider.addTarget(self, action: #selector(filledCountTextFieldAction(_:)), for: .valueChanged)
        return slider
    }()
    
    private lazy var feedBackTextField = {
        let textField = UITextField()
        textField.text = "1"
        textField.frame = CGRect(x: 50, y: 450, width: 50, height: 50)
        textField.font = textField.font?.withSize(90)
        textField.isEnabled = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // Private Methods
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(feedBackSlider)
        view.addSubview(feedBackTextField)
        feedBackTextField.center = view.center
    }
    
    @objc private func sliderStepAction(_ sender: UISlider) {
        let newValue = sender.value.rounded()
        sender.setValue(Float(newValue), animated: true)
    }
    
    @objc private func filledCountTextFieldAction(_ sender: UISlider) {
        let newValue = Int(sender.value.rounded())
        feedBackTextField.text = "\(newValue)"
    }
}
