//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 21.09.22.
//

import UIKit
/// Sharing different items
final class SharingViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var pickerInputTextField: UITextField!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var shareTextField: UITextField!
    
    // MARK: - Private properties
    private let facebook = FacebookShare()
    private lazy var sharePicker = {
        let picker = UIPickerView()
        return picker
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sharePicker.delegate = self
        sharePicker.dataSource = self
        pickerInputTextField.inputView = sharePicker
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(endEditingAction))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    // MARK: - IBAction
    
    @IBAction func shareFacebook(_ sender: Any) {
        shareAction(activityItems: [facebook])
    }
    
    @IBAction func shareURLAction(_ sender: Any) {
        guard let share = urlLabel.text else { return }
        shareAction(activityItems: [share])
    }
    
    @IBAction func shareImage(_ sender: Any) {
        guard let image = UIImage(named: "bagpack") else { return }
        shareAction(activityItems: [image])
    }
    
    @IBAction func shareTextField(_ sender: Any) {
        guard let share = shareTextField.text else { return }
        shareAction(activityItems: [share])
    }
    
    // MARK: - Private Methods
    
    private func shareAction(activityItems: [Any], applicationActivities: [UIActivity]? = nil) {
        let activityViewController = UIActivityViewController(activityItems: activityItems,
                                                              applicationActivities: applicationActivities)
        present(activityViewController, animated: true)
    }
    
    @objc func endEditingAction() {
        view.endEditing(true)
    }
}

// MARK: - UIPickerViewDelegate

extension SharingViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(row)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerInputTextField.text = "\(row)"
        if row == 3 {
            shareAction(activityItems: ["Sharing picker #\(row)"])
        }
    }
    
}

// MARK: - UIPickerViewDataSource

extension SharingViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        5
    }
}

/// FacebookShare
class FacebookShare: NSObject, UIActivityItemSource {
    
    var placeholder = "New post"
    var newsForFacebook = "For Facebook"
    var url = ""
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        placeholder
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController,
                                itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        if activityType == .postToFacebook {
            return newsForFacebook
        }
        return nil
    }
}
