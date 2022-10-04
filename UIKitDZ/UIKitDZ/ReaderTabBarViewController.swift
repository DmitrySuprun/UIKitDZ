//
//  ReaderTabBarViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 4.10.22.
//

import UIKit

/// Main controller. Navigation in application tabs
class ReaderTabBarViewController: UITabBarController {
    
    // MARK: - Private Properties
    private let readingNowViewController = ReadingNowViewController()
    private let readingNowTabBarItem = UITabBarItem(title: "Reading Now",
                                                    image: UIImage(systemName: "book.fill"),
                                                    tag: 0)
    private let libraryViewController = LibraryViewController()
    private let libraryTabBarItem = UITabBarItem(title: "Library",
                                                 image: UIImage(systemName: "books.vertical.fill"),
                                                 tag: 1)
    private let bookStoreViewController = BookStoreViewController()
    private let bookStoreTabBarItem = UITabBarItem(title: "Book Store",
                                                   image: UIImage(systemName: "bag.fill"),
                                                   tag: 2)
    private let searchViewController = SearchViewController()
    private let searchTabBarItem = UITabBarItem(title: "Search",
                                                image: UIImage(systemName: "magnifyingglass"),
                                                tag: 3)
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Properties
    private func setupUI() {
        viewControllers = [
            readingNowViewController,
            libraryViewController,
            bookStoreViewController,
            searchViewController
        ]
        readingNowViewController.tabBarItem = readingNowTabBarItem
        libraryViewController.tabBarItem = libraryTabBarItem
        bookStoreViewController.tabBarItem = bookStoreTabBarItem
        searchViewController.tabBarItem = searchTabBarItem
    }
}
