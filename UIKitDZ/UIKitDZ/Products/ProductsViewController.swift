//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 21.09.22.
//

import UIKit
/// Presentation all products
final class ProductsViewController: UIViewController {
    
    // MARK: - Public Properties
    
    var products: [Product] = []
    
    // MARK: - Private Properties
    
    private lazy var firstProduct = makeProductImage(xCoordinate: 30, yCoordinate: 200, productID: 0)
    private lazy var secondProduct = makeProductImage(xCoordinate: 215, yCoordinate: 200, productID: 1)
    private lazy var thirdProduct = makeProductImage(xCoordinate: 30, yCoordinate: 385, productID: 2)
    private lazy var forthProduct = makeProductImage(xCoordinate: 215, yCoordinate: 385, productID: 3)
    private lazy var backgroundImageView = makeBackgroundImage()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Public Methods
    
    @objc func productInfoAction(_ sender: UITapGestureRecognizer) {
        let viewController = ProductInfoViewController()
        let senderImageView = sender.view as? UIImageView
        viewController.product = products[senderImageView?.tag ?? 0]
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - setupUI

private extension ProductsViewController {
    
    func setupUI() {
        loadModelService()
        addView()
        backgroundImageView.frame = view.frame
    }
    
    func addView() {
        view.addSubview(backgroundImageView)
        view.addSubview(firstProduct)
        view.addSubview(secondProduct)
        view.addSubview(thirdProduct)
        view.addSubview(forthProduct)
    }
}

// MARK: - Factory

private extension ProductsViewController {
    
    private func makeBackgroundImage() -> UIImageView {
        let imageView = UIImageView()
        let image = UIImage(named: "Background")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    func makeProductImage(xCoordinate: Int, yCoordinate: Int, productID: Int) -> UIImageView {
        let imageView = UIImageView()
        if let name = products[productID].images.first {
            imageView.image = UIImage(named: name)
        }
        imageView.frame = CGRect(x: xCoordinate, y: yCoordinate, width: 150, height: 150)
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.systemGray3.cgColor
        imageView.contentMode = .scaleAspectFit
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(productInfoAction(_:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        imageView.tag = productID
        return imageView
    }
}

// MARK: - Load Model

extension ProductsViewController {
    
    func loadModelService() {
        products = [Product(name: "Xiaomi", images: ["XiaomiLightGray", "XiaomiGray", "XiaomiLightBlue"]),
                    Product(name: "Mi", images: ["MiBlue", "MiGray", "MiLightGray"]),
                    Product(name: "Redmi", images: ["RedmiMint", "RedmiOrange", "RedmiPink"]),
                    Product(name: "Pixel", images: ["PixelMint", "PixelPink", "PixelYelow"])
        ]
    }
}
