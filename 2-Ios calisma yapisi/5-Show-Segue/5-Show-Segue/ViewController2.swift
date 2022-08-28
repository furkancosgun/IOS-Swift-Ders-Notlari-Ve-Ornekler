//
//  ViewController2.swift
//  5-Show-Segue
//
//  Created by Furkan on 17.08.2022.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func go2back(_ sender: Any) {
        navigationController?.popViewController(animated: true)//Geldigi sayfaya doner
        navigationController?.popToRootViewController(animated: true)//ilk sayfaya doner
    }
}
