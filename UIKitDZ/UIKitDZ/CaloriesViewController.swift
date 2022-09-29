//
//  CaloriesViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 30.09.22.
//

import UIKit

/// Information about calories
final class CaloriesViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private lazy var caloriesImage = {
        let imageView = UIImageView()
        let image = UIImage(named: "Calories")
        imageView.image = image
        imageView.frame = CGRect(x: 0, y: 0, width: 350, height: 350)
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(caloriesImage)
        caloriesImage.center = view.center
        caloriesImage.contentMode = .scaleAspectFit
    }
}
