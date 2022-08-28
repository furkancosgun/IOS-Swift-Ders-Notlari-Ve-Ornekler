//
//  ViewController.swift
//  5-Activity indicator
//
//  Created by Furkan on 20.08.2022.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        indicator.startAnimating()
        //indicator.isHidden = true / false //Gorunurluk ayarı verilebilir
    }


    @IBAction func SwitchTracker(_ sender: UISwitch) {
        if sender.isOn {
            indicator.startAnimating()
        }else{
            indicator.stopAnimating()
        }
    }
    
}

