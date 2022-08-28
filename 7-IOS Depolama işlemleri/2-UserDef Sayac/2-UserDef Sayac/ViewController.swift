//
//  ViewController.swift
//  2-UserDef Sayac
//
//  Created by Furkan on 28.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    var value : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = UserDefaults.standard
        value = user.integer(forKey: "val")
        value += 1
        user.set(value, forKey: "val")
        
        lblText.text = String(value)
    }


}

