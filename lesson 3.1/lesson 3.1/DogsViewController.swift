//
//  DogsViewController.swift
//  lesson 3.1
//
//  Created by Тарас Евченко on 28.10.2021.
//

import UIKit

class DogsViewController: UIViewController {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var breedLabel: UILabel!
    
    var breed: String = ""
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        breedLabel.text = breed
    }
}
