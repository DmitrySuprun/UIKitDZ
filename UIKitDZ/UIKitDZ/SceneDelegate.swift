//
//  SceneDelegate.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 21.09.22.
//

import UIKit
/// SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - Public Properties
    
    var window: UIWindow?
    
    // MARK: - Private Properties
    
    private let productViewController = ProductsViewController()
    private var navigationController = UINavigationController()
    
    // MARK: - Public Method
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .white
        navigationController = UINavigationController(rootViewController: productViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
