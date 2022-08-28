//
//  ViewController2.swift
//  14-Tab bar controller giris
//
//  Created by Furkan on 20.08.2022.
//

import UIKit

class ViewController2: UIViewController {
    
    var value = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem.badgeValue = String(value)
    }
    
    
    @IBAction func addPoint(_ sender: Any) {
        value += 1
        self.tabBarItem.badgeValue = String(value)
        
    }
    
   
}
