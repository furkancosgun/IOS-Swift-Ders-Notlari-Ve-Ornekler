//
//  ViewController.swift
//  6-Sayfalar arasi gecis dinleme
//
//  Created by Furkan on 18.08.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Birinci ekrandan ikinci ekrana gecildi")
    }

}

