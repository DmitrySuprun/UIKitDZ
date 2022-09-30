//
//  SlotMashineViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 30.09.22.
//

import UIKit
/// SlotMachine for trying to win free pizza
class SlotMachineViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var winNumber = 0
    
    private lazy var slotPicker = {
        let picker = UIPickerView()
        return picker
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        view.backgroundColor = .orange
        view.addSubview(slotPicker)
        setupSlotPicker()
    }
    
    private func setupSlotPicker() {
        slotPicker.center = view.center
        slotPicker.delegate = self
        slotPicker.dataSource = self
    }
    
    private func checkNumber() {
        if winNumber == Int.random(in: 0...30) {
            print("You Win free pizza")
        }
    }
}

// MARK: - UIPickerViewDelegate

extension SlotMachineViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "*"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        winNumber = row
        checkNumber()
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - UIPickerViewDataSource

extension SlotMachineViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        30
    }
}
