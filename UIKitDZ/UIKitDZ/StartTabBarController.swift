//
//  StartTabBarController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 2.10.22.
//

import UIKit

/// StartTabBarController provide TestViewController with Label
final class StartTabBarController: UITabBarController {
    
    // MARK: - Private Properties
    private let firstViewController = FirstViewController()
    private let firstTabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
    private let secondViewController = SecondViewController()
    private let secondTabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 2)
    private let thirdViewController = ThirdViewController()
    private let thirdTabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 3)
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Method
    private func setupUI() {
        view.backgroundColor = .systemOrange
        addViewControllers()
    }
    
    private func addViewControllers() {
        firstViewController.tabBarItem = firstTabBarItem
        secondViewController.tabBarItem = secondTabBarItem
        thirdViewController.tabBarItem = thirdTabBarItem
        viewControllers = [firstViewController, secondViewController, thirdViewController]
    }
}
