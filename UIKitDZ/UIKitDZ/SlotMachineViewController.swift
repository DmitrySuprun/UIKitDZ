//
//  SlotMashineViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 30.09.22.
//

import UIKit
/// Try to win free pizza
class SlotMachineViewController: UIViewController {
    
    private var winNumber = 0
    
    private lazy var slotPicker = {
        let picker = UIPickerView()
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        slotPicker.delegate = self
        slotPicker.dataSource = self
        view.addSubview(slotPicker)
        slotPicker.center = view.center
    }
    
    private func checkNumber() {
        if winNumber == Int.random(in: 0...30) {
            print("You Win free pizza")
        }
    }
}

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

extension SlotMachineViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        30
    }
}
