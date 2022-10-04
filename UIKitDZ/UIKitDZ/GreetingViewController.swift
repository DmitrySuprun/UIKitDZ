//
//  GreetingViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 3.10.22.
//

import UIKit

/// Login/SignUp choice
final class GreetingViewController: UIViewController {
    // MARK: - Public Properties
    lazy var checkingUserHandler: (User) -> (Bool) = { [weak self] user in
        self?.userDataBase.contains { $0.name == user.name } ?? false
    }
    
    lazy var addUserHandler: (User) -> () = { [weak self] user in
        self?.userDataBase.append(user)
    }
    
    // MARK: - Private Properties
    private var userDataBase: [User] = []
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        userDataBase = loadUserDataBase()
    }
    
    // MARK: - Public Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? SignUPViewController {
            destinationViewController.checkingUser = checkingUserHandler
        }
//        if let destinationViewController = segue.destination as? LoginViewController {
//            destinationViewController.addUser = addUserHandler
//        }
    }
    
    // MARK: - Private Methods
    private func loadUserDataBase() -> [User] {
        let dataBase = [User(name: "Ann", email: "ann@google.com", password: "123"),
                        User(name: "Bill", email: "bill@google.com", password: "123"),
                        User(name: "John", email: "john@google.com", password: "123"),
                        User(name: "Marta", email: "marta@google.com", password: "123")
        ]
        return dataBase
    }
}
