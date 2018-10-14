//
//  ViewController.swift
//  Taskmaps
//
//  Created by Sriram Prasad on 12/10/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let cityVcIdentifier = "cityVC"
    let pickerIdentifier = "pickerVC"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Main VC"
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }

   

    @IBAction func pickerViewButton(_ sender: Any) {
        performSegue(withIdentifier: pickerIdentifier, sender: nil)
    }
    
  
    
    @IBAction func mapsButton(_ sender: UIButton) {
        performSegue(withIdentifier: cityVcIdentifier, sender: nil)

    }
    
    
    
}

