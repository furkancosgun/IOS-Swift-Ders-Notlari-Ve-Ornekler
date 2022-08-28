//
//  ViewController.swift
//  2-Nesneleri sinifa baglama
//
//  Created by Furkan on 17.08.2022.
//

import UIKit

class ViewController: UIViewController {

    //Gorsel nesnenin uzerinden tutarak ctrl ile kod alanına birakmak yeterli
    @IBOutlet weak var lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btn(_ sender: Any) {
        lbl.text = "Furkan"
    }
    
}

