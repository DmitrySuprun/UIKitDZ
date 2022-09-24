//
//  ReservationViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 22.09.22.
//

import UIKit
/// Контроллер для создания брони
final class ReservationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createCheckAction(_ sender: Any) {
        let  confirmAlertController = UIAlertController(
            title: "Счет",
            message: "Выставить счет?",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default) {_ in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let reservationViewController = storyboard.instantiateViewController(
                withIdentifier: "PaymentCheckViewControllerID"
            )
            self.navigationController?.pushViewController(reservationViewController, animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        confirmAlertController.addAction(okAction)
        confirmAlertController.addAction(cancelAction)
        present(confirmAlertController, animated: true)

    }
}
