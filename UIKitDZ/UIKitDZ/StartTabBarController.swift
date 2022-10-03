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
    private let firstViewController = DownloadViewController()
    private let firstTabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
    private var firstNavigationController = UINavigationController()
    
    private let secondViewController = FeatureViewController()
    private let secondTabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 2)
    private var secondNavigationController = UINavigationController()
    
    private let thirdViewController = HistoryViewController()
    private let thirdTabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 3)
    private var thirdNavigationController = UINavigationController()

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
        firstNavigationController = UINavigationController(rootViewController: firstViewController)
        secondNavigationController = UINavigationController(rootViewController: secondViewController)
        thirdNavigationController = UINavigationController(rootViewController: thirdViewController)
        
        firstViewController.tabBarItem = firstTabBarItem
        secondViewController.tabBarItem = secondTabBarItem
        thirdViewController.tabBarItem = thirdTabBarItem
        
        viewControllers = [firstNavigationController, secondNavigationController, thirdNavigationController]
    }
}
