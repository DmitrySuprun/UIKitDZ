//
//  DownloadViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 21.09.22.
//

import UIKit

/// DownloadViewController test TabBarController
final class DownloadViewController: UIViewController {
    
    // MARK: - Private Properties
    private lazy var mutatingLabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 150, height: 200)
        label.text = "Text"
        label.lineBreakMode = .byWordWrapping
        label.shadowColor = .brown
        label.shadowOffset = CGSize(width: 3, height: 3)
        label.layer.shadowOffset = CGSize(width: 5, height: 5)
        label.layer.shadowRadius = 2
        label.layer.shadowOpacity = 2
        label.textAlignment = .center
        label.backgroundColor = .systemGray
        return label
    }()
    
    private lazy var changeSizeSlider = {
        let slider = UISlider()
        slider.frame = CGRect(x: 0, y: 0, width: 300, height: 30)
        slider.minimumValue = 10
        slider.maximumValue = 40
        slider.addTarget(self, action: #selector(changeFontSizeAction), for: .valueChanged)
        return slider
    }()
    
    private lazy var changeColorLinesPickerView = {
        let picker = UIPickerView()
        picker.frame = CGRect(x: 90, y: 120, width: 200, height: 200)
        return picker
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        addViews()
        setupPicker()
        setupSlider()
        setupLabel()

        title = "First"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(textInputAction))
    }
    
    private func addViews() {
        view.addSubview(mutatingLabel)
        view.addSubview(changeSizeSlider)
        view.addSubview(changeColorLinesPickerView)
    }
    
    private func setupPicker() {
        changeColorLinesPickerView.dataSource = self
        changeColorLinesPickerView.delegate = self
    }
    
    private func setupSlider() {
        let minSize = mutatingLabel.font.pointSize
        changeSizeSlider.value = Float(minSize)
        changeSizeSlider.center = view.center
        changeSizeSlider.center.y += 150
    }
    
    private func setupLabel() {
        mutatingLabel.center = view.center
    }
    
    @objc private func changeFontSizeAction(_ sender: UISlider) {
        mutatingLabel.font = mutatingLabel.font.withSize(CGFloat(sender.value))
    }
    
    @objc private func textInputAction() {
        let alertController = UIAlertController(title: "Attention", message: "Enter text", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) {_ in
            self.mutatingLabel.text = alertController.textFields?.first?.text ?? ""
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        alertController.addTextField()
        present(alertController, animated: true)
    }
}

// MARK: - Extension UIPickerViewDelegate
extension DownloadViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            switch row {
            case 0: return "Black"
            case 1: return "Blue"
            case 2: return "Green"
            case 3: return "Red"
            case 4: return "Gray"
            default: return "?"
            }
        case 1:
            return "\(row + 1)"
        default: return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            switch row {
            case 0: mutatingLabel.textColor = .black
            case 1: mutatingLabel.textColor = .blue
            case 2: mutatingLabel.textColor = .green
            case 3: mutatingLabel.textColor = .red
            case 4: mutatingLabel.textColor = .gray
            default: break
            }
        case 1:
            mutatingLabel.numberOfLines = row + 1
        default: break
        }
    }
}

// MARK: - Extension UIPickerViewDataSource
extension DownloadViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0: return 5
        case 1: return 10
        default: return 0
        }
    }
}
