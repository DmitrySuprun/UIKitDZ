//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 21.09.22.
//

import UIKit
/// Presentation all products
final class ProductsViewController: UIViewController {
    
    // MARK: - Private Properties

    private lazy var firstProduct = makeProductImage(xCoordinate: 30, yCoordinate: 200)
    private lazy var secondProduct = makeProductImage(xCoordinate: 215, yCoordinate: 200)
    private lazy var thirdProduct = makeProductImage(xCoordinate: 30, yCoordinate: 385)
    private lazy var forthProduct = makeProductImage(xCoordinate: 215, yCoordinate: 385)
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - setupUI

private extension ProductsViewController {
    
    func setupUI() {
        addView()
    }
    
    func addView() {
        view.addSubview(firstProduct)
        view.addSubview(secondProduct)
        view.addSubview(thirdProduct)
        view.addSubview(forthProduct)
    }
}

// MARK: - Factory

private extension ProductsViewController {
    
    func makeProductImage(xCoordinate: Int, yCoordinate: Int) -> UIImageView {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: xCoordinate, y: yCoordinate, width: 150, height: 150)
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray6
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
}
