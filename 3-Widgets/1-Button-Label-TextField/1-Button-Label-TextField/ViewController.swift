//
//  ViewController.swift
//  1-Button-Label-TextField
//
//  Created by Furkan on 20.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func writeLabel(_ sender: Any) {
        if let metin = textField.text{//textfield içindeki deger optional oldugu için optional degeri yok ediyoruz
            
            txtLabel.text = metin
        }
    }
    

}

