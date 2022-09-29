//
//  PizzaSelectionViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 29.09.22.
//

import UIKit

// Choosing a pizza from the list
final class PizzaSelectionViewController: UIViewController {
    
    // MARK: - Public Properties
    
    var pizza: [Pizza] = [Pizza(name: "Margarita", image: "Margarita"),
                          Pizza(name: "Pepperoni", image: "Pepperoni")]
    
    // MARK: - Private Properties
    
    private lazy var margaritaImageView = makeImageView(yCoordinate: 166)
    private lazy var pepperoniImageView = makeImageView(yCoordinate: 371)
    private lazy var margaritaLabel = makeLabel(text: "Margarita", yCoordinate: 213)
    private lazy var pepperoniLabel = makeLabel(text: "Pepperoni", yCoordinate: 418)
    private lazy var margaritaAddIngredientsButton = makeButton(yCoordinate: 208)
    private lazy var pepperoniAddIngredientsButton = makeButton(yCoordinate: 413)
    private lazy var feedBackButton = makeFeedBackButton()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
   
    // MARK: - Private Methods
    
    private func setupUI() {
        title = "Pizza"
        view.backgroundColor = .white
        addView()
        setupButton()
        setupImage()
        setupNavigationBar()
    }
    
    private func addView() {
        view.addSubview(margaritaImageView)
        view.addSubview(pepperoniImageView)
        view.addSubview(margaritaLabel)
        view.addSubview(pepperoniLabel)
        view.addSubview(margaritaAddIngredientsButton)
        view.addSubview(pepperoniAddIngredientsButton)
        view.addSubview(feedBackButton)
    }
    
    private func setupButton() {
        margaritaAddIngredientsButton.tag = 0
        pepperoniAddIngredientsButton.tag = 1
    }
    
    private func setupImage() {
        margaritaImageView.image = UIImage(named: pizza[0].image)
        pepperoniImageView.image = UIImage(named: pizza[1].image)
        
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
    
    @objc private func feedBackAction() {
        let viewController = FeedBackViewController()
        viewController.modalPresentationStyle = .formSheet
        present(viewController, animated: true)
    }
    
    @objc private func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func addIngredientsAction(_ sender: UIButton) {
        let ingredientsViewController = IngredientsViewController()
        ingredientsViewController.pizza = pizza[sender.tag]
        ingredientsViewController.modalPresentationStyle = .formSheet
        present(ingredientsViewController, animated: true)
    }
}

// MARK: - Factory

extension PizzaSelectionViewController {
    
    func makeImageView(yCoordinate: Int) -> UIImageView {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 43, y: yCoordinate, width: 135, height: 135)
        return imageView
    }
    
    func makeLabel(text: String, yCoordinate: Int) -> UILabel {
        let label = UILabel()
        label.text = text
        label.frame = CGRect(x: 196, y: yCoordinate, width: 85, height: 25)
        return label
    }
    
    func makeButton(yCoordinate: Int) -> UIButton {
        let button = UIButton(configuration: .filled())
        let image = UIImage(systemName: "plus")
        button.setImage(image, for: .normal)
        button.tintColor = .systemOrange
        button.frame = CGRect(x: 329, y: yCoordinate, width: 35, height: 35)
        button.addTarget(self, action: #selector(addIngredientsAction(_:)), for: .touchUpInside)
        return button
    }
}

// Feature

private extension PizzaSelectionViewController {
    
    func makeFeedBackButton() -> UIButton {
        let button = UIButton(configuration: .filled())
        button.setImage(UIImage(systemName: "arrowshape.turn.up.backward.2"), for: .normal)
        button.frame = CGRect(x: 296, y: 754, width: 40, height: 40)
        button.tintColor = .orange
        button.addTarget(self, action: #selector(feedBackAction), for: .touchUpInside)
        return button
    }
}
