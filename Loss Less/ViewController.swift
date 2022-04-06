//
//  ViewController.swift
//  Loss Less
//
//  Created by Stefanus Hermawan Sebastian on 24/03/22.
//

import UIKit
import Foundation
import CoreData

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var lblFoodnameTxt: UIButton!
    
    @IBAction func lblFoodName(_ sender: Any) {
        lblFoodnameTxt.setTitle("test", for: .normal)
    }
    
    
    //lblFoodnameTxt.setTitle("test", for: .normal)
        
    
    
}

