//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 21.09.22.
//

import UIKit
/// View Controller which contains playLists
final class PListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? PlayerViewController else { return }
        switch segue.identifier {
        case "peremenID": viewController.startWithTrack = (song: "Peremen", albumImage: "LastHero")
        case "windOfChangeID": viewController.startWithTrack = (song: "WindOfChange", albumImage: "CrazyWord")
        default: return
        }
    }
}
