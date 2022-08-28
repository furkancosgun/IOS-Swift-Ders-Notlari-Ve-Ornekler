//
//  ViewController.swift
//  8-Present-modally-veri-transferi
//
//  Created by Furkan on 19.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtdata: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnSend(_ sender: Any) {
        if txtdata.text != "" {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let goTo2 = storyBoard.instantiateViewController(withIdentifier: "screen2") as! ViewController2
            goTo2.metin = txtdata.text
            self.present(goTo2, animated: true)
        }
    }
}

