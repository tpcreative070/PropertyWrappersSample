//
//  ViewController.swift
//  PropertyWrappersSample
//
//  Created by phong070 on 29/07/2021.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UserDefaults.hasIntializedValue = false
        print(UserDefaults.hasIntializedValue) // Prints: false
        UserDefaults.hasIntializedValue = true
        print(UserDefaults.hasIntializedValue) // Prints: true
    }
}

