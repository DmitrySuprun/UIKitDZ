//
//  ReaderViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 4.10.22.
//

import UIKit

// Main reader interface
final class ReaderViewController: UIViewController {
    
    // MARK: - Private Properties
    let book = Book()
    
    private lazy var bookTextView = {
        let textView = UITextView()
        textView.text = book.text
        textView.frame = view.frame
        return textView
    }()
    
    private lazy var settingsButton = {
        let button = UIButton(configuration: .borderless())
        button.frame = CGRect(x: 340, y: 30, width: 50, height: 50)
        button.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        button.addTarget(self, action: #selector(settingsAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var settingsView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 485, width: 394, height: 300)
        view.isHidden = true
        view.backgroundColor = .systemGray
        return view
    }()
    
    private lazy var fontSlider = {
        let slider = UISlider()
        slider.frame = CGRect(x: 15, y: 30, width: 369, height: 25)
        slider.addTarget(self, action: #selector(changeFontSizeAction(_:)), for: .valueChanged)
        slider.minimumValue = 10
        slider.maximumValue = 50
        return slider
    }()
    
    private lazy var redColorButton = {
        let button = UIButton(configuration: .filled())
        button.frame = CGRect(x: 50, y: 60, width: 40, height: 40)
        button.addTarget(self, action: #selector(changeFontColorAction), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.tintColor = .systemRed
        return button
    }()
    
    private lazy var blueColorButton = {
        let button = UIButton(configuration: .filled())
        button.frame = CGRect(x: 100, y: 60, width: 40, height: 40)
        button.addTarget(self, action: #selector(changeFontColorAction), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.tintColor = .systemBlue
        return button
    }()
    
    private lazy var greenColorButton = {
        let button = UIButton(configuration: .filled())
        button.frame = CGRect(x: 150, y: 60, width: 40, height: 40)
        button.addTarget(self, action: #selector(changeFontColorAction), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.tintColor = .systemGreen
        return button
    }()
    
    private lazy var orangeColorButton = {
        let button = UIButton(configuration: .filled())
        button.frame = CGRect(x: 200, y: 60, width: 40, height: 40)
        button.addTarget(self, action: #selector(changeFontColorAction), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.tintColor = .systemOrange
        return button
    }()
    
    private lazy var thinFontButton = {
        let button = UIButton(configuration: .borderless())
        button.frame = CGRect(x: 250, y: 60, width: 40, height: 40)
        button.setTitle("A", for: .normal)
        button.addTarget(self, action: #selector(thinFontAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var boldFontButton = {
        let button = UIButton(configuration: .borderless())
        button.frame = CGRect(x: 300, y: 60, width: 40, height: 40)
        button.setTitle("A", for: .normal)
        button.addTarget(self, action: #selector(boldFontAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var darkModeSwitch = {
        let modeSwitch = UISwitch()
        modeSwitch.frame = CGRect(x: 15, y: 200, width: 50, height: 25)
        modeSwitch.addTarget(self, action: #selector(changeDarkModeAction), for: .valueChanged)
        return modeSwitch
    }()
    
    private lazy var fontTextField = {
        let textField = UITextField()
        textField.placeholder = "Font"
        textField.frame = CGRect(x: 20, y: 130, width: 360, height: 25)
        return textField
    }()
    
    private lazy var fontPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Objc Private Properties
    @objc private func settingsAction() {
        settingsView.isHidden.toggle()
    }
    
    @objc private func changeFontSizeAction(_ sender: UISlider) {
        bookTextView.font = UIFont.systemFont(ofSize: CGFloat(sender.value))
    }
    
    @objc private func changeFontColorAction(_ sender: UIButton) {
        bookTextView.textColor = sender.tintColor
    }
    
    @objc private func thinFontAction() {
        let font = bookTextView.font
        bookTextView.font = UIFont.systemFont(ofSize: font?.pointSize ?? 10, weight: .thin)
    }
    
    @objc private func boldFontAction() {
        let font = bookTextView.font
        bookTextView.font = UIFont.systemFont(ofSize: font?.pointSize ?? 10, weight: .heavy)
    }
    
    @objc private func changeDarkModeAction() {
        overrideUserInterfaceStyle = .dark
    }
    
    // MARK: - Private Properties
    private func setupUI() {
        addViews()
        setupTextFieldAction()
        fontTextField.inputView = fontPickerView
        fontPickerView.delegate = self
        fontPickerView.dataSource = self
    }
    
    private func addViews() {
        view.addSubview(bookTextView)
        bookTextView.frame = view.frame
        view.addSubview(settingsView)
        view.addSubview(settingsButton)
        settingsView.addSubview(fontSlider)
        settingsView.addSubview(redColorButton)
        settingsView.addSubview(blueColorButton)
        settingsView.addSubview(greenColorButton)
        settingsView.addSubview(redColorButton)
        settingsView.addSubview(orangeColorButton)
        settingsView.addSubview(thinFontButton)
        settingsView.addSubview(boldFontButton)
        settingsView.addSubview(darkModeSwitch)
        settingsView.addSubview(fontTextField)
    }
    
    private func setupTextFieldAction() {
        
    }
}

// MARK: - UIPickerViewDelegate
extension ReaderViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0: return "Font1"
        case 1: return "Font2"
        default: return "Error"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let size = bookTextView.font?.pointSize ?? 20
        switch row {
        case 0: bookTextView.font = UIFont(name: "KannadaSangamMN", size: size)
        case 1: bookTextView.font = UIFont(name: "SnellRoundhand", size: size)
        case 2: bookTextView.font = UIFont(name: "ArialMT", size: size)
        default: break
        }
        pickerView.resignFirstResponder()
    }
}

// MARK: - UIPickerViewDataSource
extension ReaderViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        3
    }
}
