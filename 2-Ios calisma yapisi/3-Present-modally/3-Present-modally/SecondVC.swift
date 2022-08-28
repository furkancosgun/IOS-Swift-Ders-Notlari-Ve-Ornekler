//
//  SecondVC.swift
//  3-Present-modally
//
//  Created by Furkan on 17.08.2022.
//

import UIKit

class SecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func go2back(_ sender: Any) {//Geriye donus icin kullanilir
        self.dismiss(animated: true)
    }
    
    
}
