//
//  ReaderTabBarViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 4.10.22.
//

import UIKit
// MARK: - Constants
private extension ReaderTabBarViewController {
    enum  Constant {
        static let readingNowText = "Reading Now"
        static let libraryText = "Library"
        static let bookStoreText = "Book Store"
        static let searchText = "Search"
    }
}

/// Main controller. Navigation in application tabs
final class ReaderTabBarViewController: UITabBarController {
    // MARK: - Private Properties
    private let readingNowViewController = ReadingNowViewController()
    private let readingNowTabBarItem = UITabBarItem(title: Constant.readingNowText,
                                                    image: UIImage(systemName: "book.fill"),
                                                    tag: 0)
    private let libraryViewController = LibraryViewController()
    private let libraryTabBarItem = UITabBarItem(title: Constant.libraryText,
                                                 image: UIImage(systemName: "books.vertical.fill"),
                                                 tag: 1)
    private let bookStoreViewController = BookStoreViewController()
    private let bookStoreTabBarItem = UITabBarItem(title: Constant.bookStoreText,
                                                   image: UIImage(systemName: "bag.fill"),
                                                   tag: 2)
    private let searchViewController = SearchViewController()
    private let searchTabBarItem = UITabBarItem(title: Constant.searchText,
                                                image: UIImage(systemName: "magnifyingglass"),
                                                tag: 3)
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
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
