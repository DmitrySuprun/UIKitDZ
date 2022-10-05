//
//  DriftViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 5.10.22.
//

import UIKit

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
    @IBAction func orderButton(_ sender: Any) {
        var message = "\(hoursCountLabel.text ?? "") h. drifting\n on \(driftDatePicker.date)\n"
        message += "\(carChoiceSegmentControl.titleForSegment(at: carChoiceSegmentControl.selectedSegmentIndex) ?? "")"
        let alertController = UIAlertController(title: "Order", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Order", style: .default) {_ in
            self.dismiss(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    @IBAction private func carChoiceSegmentControlAction(_ sender: Any) {
        switch carChoiceSegmentControl.selectedSegmentIndex {
        case 0: carImageView.image = UIImage(named: "370Z")
        case 1: carImageView.image = UIImage(named: "BMW")
        case 2: carImageView.image = UIImage(named: "Mustang")
        default: return
        }
    }
   
    @IBAction func changeCountHoursSliderAction(_ sender: Any) {
        let value = hoursCountSlider.value.rounded()
        hoursCountSlider.setValue(value, animated: true)
        hoursCountLabel.text = "\(Int(value))"
    }
}
