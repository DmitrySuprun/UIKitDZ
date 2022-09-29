//
//  ProductInfoViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 26.09.22.
//

import UIKit
/// Information about product
final class ProductInfoViewController: UIViewController {
    
    // MARK: - Public Properties

    var product: Product?
    
    // MARK: - Private Properties

    private lazy var productImage = makeImageView()
    private lazy var colorSegmentControl = makeSegmentControl()
    private lazy var buyButton = makeButton()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - setupUI

extension ProductInfoViewController {
    
    private func setupUI() {
        title = "Product Info"
        view.backgroundColor = .white
        addView()
        productImage.center = view.center
        colorSegmentControl.center = view.center
        colorSegmentControl.center.y += 200
        buyButton.center = view.center
        buyButton.center.y += 270
    }
    
    private func addView() {
        view.addSubview(productImage)
        view.addSubview(colorSegmentControl)
        view.addSubview(buyButton)
    }
    
    @objc private func chooseColorAction(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        productImage.image = UIImage(named: product?.images[index] ?? "")
    }
    
    @objc private func makeOrderAction() {
        let nextViewController = OrderViewController()
        nextViewController.product = product
        nextViewController.currentColor = colorSegmentControl.selectedSegmentIndex
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

// MARK: - Factory

extension ProductInfoViewController {
    
    private func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        if let image = product?.images.first {
            imageView.image = UIImage(named: image)
        }
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    private func makeSegmentControl() -> UISegmentedControl {
        let segmentControl = UISegmentedControl(items: product?.images)
        segmentControl.sizeToFit()
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(chooseColorAction(_:)), for: .valueChanged)
        return segmentControl
    }
    
    private func makeButton() -> UIButton {
        let button = UIButton(configuration: .filled())
        button.setTitle("Order Now", for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(makeOrderAction), for: .touchUpInside)
        return button
    }
}
