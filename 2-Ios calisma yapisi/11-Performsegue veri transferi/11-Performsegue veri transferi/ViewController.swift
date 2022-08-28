//
//  ViewController.swift
//  11-Performsegue veri transferi
//
//  Created by Furkan on 19.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToA(_ sender: Any) {
        let text = textField.text
        performSegue(withIdentifier: "goToA", sender: text)
    }
    
    @IBAction func goToB(_ sender: Any) {
        let text = textField.text
        performSegue(withIdentifier: "goToB", sender: text)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let veri = sender as? String{
            if segue.identifier == "goToA"{
                let screenA = segue.destination as! ViewControllerA
                screenA.data = veri
            }else if segue.identifier == "goToB"{
                let screenB = segue.destination as! ViewControllerB
                screenB.data = veri
            }
        }
    }
}

