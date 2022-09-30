//
//  SceneDelegate.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 21.09.22.
//

import UIKit
/// SceneDelegate
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - Public Properties
    var window: UIWindow?
    
    // MARK: - Private Properties
    private let productViewController = LoginViewController()
    
    // MARK: - Public Method
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .white
        window?.rootViewController = productViewController
        window?.makeKeyAndVisible()
    }
}
