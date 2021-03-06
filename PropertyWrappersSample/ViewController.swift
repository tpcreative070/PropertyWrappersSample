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
        
        //Using optional
        UserDefaults.yourAge = 20
        print(UserDefaults.yourAge)
        UserDefaults.yourAge = nil
        print(UserDefaults.yourAge)
        
        //Observer data
        let subscription = UserDefaults.$userName.sink { value in
            print(value)
        }
        UserDefaults.userName = "IOS"
    }
}

