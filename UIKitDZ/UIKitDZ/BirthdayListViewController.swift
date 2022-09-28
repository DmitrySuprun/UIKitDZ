//
//  BirthdayListViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 24.09.22.
//

import UIKit
/// Display list with birthday information
final class BirthdayListViewController: UIViewController {
    
    var userInfo: [UserInfo]?
    
    private lazy var contentUserInfoView = {
        let view = UIView()
        return view
    }()
    
    private lazy var logoImageImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var nameLabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var birthdayInfoLabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var remainingDaysLabel = {
        let label = UILabel()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Birthday"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(pushNextViewControllerAction(_:)))
        
        view.addSubview(contentUserInfoView)
        contentUserInfoView.frame = CGRect(x: 20,
                                           y: 200,
                                           width: view.frame.width - 40,
                                           height: 100)
        
        contentUserInfoView.addSubview(logoImageImageView)
        logoImageImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        logoImageImageView.image = UIImage(systemName: "person.circle.fill")
        
        contentUserInfoView.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: 100, y: 0, width: 200, height: 50)
        nameLabel.text = "Name"
        
        contentUserInfoView.addSubview(birthdayInfoLabel)
        birthdayInfoLabel.frame = CGRect(x: 100, y: 50, width: 200, height: 50)
        birthdayInfoLabel.text = "103 day left"
        
        contentUserInfoView.addSubview(remainingDaysLabel)
        remainingDaysLabel.frame = CGRect(x: 300, y: 0, width: 60, height: 50)
        remainingDaysLabel.text = "35 Days"
        
    }
    
    @objc func pushNextViewControllerAction(_ sender: UIBarButtonItem) {
        let addingUserViewController = AddingUserViewController()
        addingUserViewController.modalPresentationStyle = .formSheet
        navigationController?.present(addingUserViewController, animated: true)
    }
}
