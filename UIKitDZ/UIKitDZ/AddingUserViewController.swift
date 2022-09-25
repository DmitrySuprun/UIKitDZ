//
//  AddingUserViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 24.09.22.
//

import UIKit
/// Controller for adding new user
final class AddingUserViewController: UIViewController {
    
    private var sex = ["male", "female"]
    
    private lazy var logoImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var changeLogoButton = {
        let button = UIButton(configuration: .borderless())
        button.setTitle("Change photo", for: .normal)
        return button
    }()
    
    private lazy var nameLabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var nameTextField = {
        let textField = UITextField()
        textField.placeholder = "Enter name"
        return textField
    }()
    
    private lazy var dateLabel = {
        let label = UILabel()
        label.text = "Date"
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var dateTextField = {
        let textField = UITextField()
        textField.placeholder = "Enter date"
        textField.inputView = datePicker
        textField.inputAccessoryView = toolBarPicker
        return textField
    }()
    
    private lazy var ageLabel = {
        let label = UILabel()
        label.text = "Age"
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var ageTextField = {
        let textField = UITextField()
        textField.placeholder = "Add age"
        textField.inputView = agePicker
        textField.inputAccessoryView = toolBarPicker
        return textField
    }()
    
    private lazy var sexLabel = {
        let label = UILabel()
        label.text = "Sex"
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var sexTextField = {
        let textField = UITextField()
        textField.placeholder = "Choose"
        textField.inputView = sexPicker
        textField.inputAccessoryView = toolBarPicker
        return textField
    }()
    
    private lazy var instagramLabel = {
        let label = UILabel()
        label.text = "Instagram"
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var instagramTextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your instagram account"
        textField.addTarget(self, action: #selector(fillInstagramTextFieldAction(_:)), for: .allTouchEvents)
        return textField
    }()
    
    private lazy var toolBarPicker = {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(self.toolbarDoneAction))
        toolBar.setItems([doneButton], animated: true)
        return toolBar
    }()
    
    private lazy var datePicker = {
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .wheels
        picker.datePickerMode = .date
        return picker
    }()
    
    private var agePicker = UIPickerView()
    private var sexPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        agePicker.dataSource = self
        agePicker.delegate = self
        agePicker.tag = 1
        sexPicker.dataSource = self
        sexPicker.delegate = self
        sexPicker.tag = 2
    }
    
    func setupUI() {
        
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(backAction(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(backAction(_:)))
        
        view.addSubview(logoImageView)
        logoImageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        logoImageView.center = view.center
        logoImageView.center.y -= 220
        logoImageView.image = UIImage(systemName: "person.circle.fill")
        
        view.addSubview(changeLogoButton)
        changeLogoButton.frame = CGRect(x: 0, y: 0, width: 200, height: 20)
        changeLogoButton.center = view.center
        changeLogoButton.center.y -= 100
        
        view.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: 20, y: 350, width: 100, height: 30)
        
        view.addSubview(nameTextField)
        nameTextField.frame = CGRect(x: 20, y: 380, width: 300, height: 30)
        nameTextField.addUnderLine()
        
        view.addSubview(dateLabel)
        dateLabel.frame = CGRect(x: 20, y: 420, width: 100, height: 30)
        
        view.addSubview(dateTextField)
        dateTextField.frame = CGRect(x: 20, y: 450, width: 300, height: 30)
        dateTextField.addUnderLine()
        
        view.addSubview(ageLabel)
        ageLabel.frame = CGRect(x: 20, y: 490, width: 100, height: 30)
        
        view.addSubview(ageTextField)
        ageTextField.frame = CGRect(x: 20, y: 520, width: 300, height: 30)
        ageTextField.addUnderLine()
        
        view.addSubview(sexLabel)
        sexLabel.frame = CGRect(x: 20, y: 560, width: 100, height: 30)
        
        view.addSubview(sexTextField)
        sexTextField.frame = CGRect(x: 20, y: 590, width: 300, height: 30)
        sexTextField.addUnderLine()
        
        view.addSubview(instagramLabel)
        instagramLabel.frame = CGRect(x: 20, y: 630, width: 100, height: 30)
        
        view.addSubview(instagramTextField)
        instagramTextField.frame = CGRect(x: 20, y: 660, width: 300, height: 30)
        instagramTextField.addUnderLine()
    }
    
    @objc func toolbarDoneAction() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        dateTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    @objc func backAction(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func fillAgeTextField(_ sender: UITextView) {
        
    }
    
    @objc func fillInstagramTextFieldAction(_ sender: UILabel) {
        let alertController = UIAlertController(title: "Enter instagram account",
                                                message: nil,
                                                preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "Ok", style: .default) {_ in
            self.instagramTextField.text = alertController.textFields?.first?.text
        }
        let cancelAlertAction = UIAlertAction(title: "Cancel", style: .destructive)
        alertController.addTextField()
        alertController.textFields?.first?.text = self.instagramTextField.text
        alertController.addAction(okAlertAction)
        alertController.addAction(cancelAlertAction)
        present(alertController, animated: true)
    }
}

extension AddingUserViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1: return 100
        case 2: return 2
        default: return 0
        }
    }
}

extension AddingUserViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1: return "\(row)"
        case 2: return sex[row]
        default: return "Error"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1: ageTextField.text = "\(row)"
            ageTextField.resignFirstResponder()
        case 2: sexTextField.text = sex[row]
            sexTextField.resignFirstResponder()
        default: return
        }
    }
}
