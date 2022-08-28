//
//  ViewController.swift
//  16-Toolbar kullanimi
//
//  Created by Furkan on 20.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtLabel: UILabel!
   
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Toolbar tabbara cok benzemektedir sadece toolbar uzerine resim veya yazı eklenir
        
    }
 
    @IBAction func back(_ sender: Any) {
        txtLabel.text = "Back pressed"
    }
    
    @IBAction func home(_ sender: Any) {
        txtLabel.text = "Home pressed"
    }
    @IBAction func tornado(_ sender: Any) {
        txtLabel.text = "Tornado pressed"
    }
}

