//
//  DriftViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 5.10.22.
//

import UIKit

// MARK: - Constants
private extension DriftViewController {
    enum Constant {
        static let alertCancelMessage = "Cancel"
        static let driftingOnText = "h. drifting\n on"
        static let orderTitle = "Order"
        static let nissanText = "370Z"
        static let bmwText = "BMW"
        static let mustangText =  "Mustang"
    }
}

/// Drifting order
final class DriftViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var carImageView: UIImageView!
    @IBOutlet private weak var carChoiceSegmentControl: UISegmentedControl!
    @IBOutlet private weak var hoursCountLabel: UILabel!
    @IBOutlet private weak var hoursCountSlider: UISlider!
    @IBOutlet private weak var driftDatePicker: UIDatePicker!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    @IBAction func orderButtonAction(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YY"
        let driftingDate = formatter.string(from: driftDatePicker.date)
        var message = "\(hoursCountLabel.text ?? "") \(Constant.driftingOnText) \(driftingDate)\n"
        message += "\(carChoiceSegmentControl.titleForSegment(at: carChoiceSegmentControl.selectedSegmentIndex) ?? "")"
        let alertController = UIAlertController(title: Constant.orderTitle, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: Constant.orderTitle, style: .default) {_ in
            self.dismiss(animated: true)
        }
        let cancelAction = UIAlertAction(title: Constant.alertCancelMessage, style: .destructive)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    @IBAction private func carChoiceSegmentControlAction(_ sender: Any) {
        switch carChoiceSegmentControl.selectedSegmentIndex {
        case 0: carImageView.image = UIImage(named: Constant.nissanText)
        case 1: carImageView.image = UIImage(named: Constant.bmwText)
        case 2: carImageView.image = UIImage(named: Constant.mustangText)
        default: return
        }
    }
   
    @IBAction func changeCountHoursSliderAction(_ sender: Any) {
        let value = hoursCountSlider.value.rounded()
        hoursCountSlider.setValue(value, animated: true)
        hoursCountLabel.text = "\(Int(value))"
    }
}
