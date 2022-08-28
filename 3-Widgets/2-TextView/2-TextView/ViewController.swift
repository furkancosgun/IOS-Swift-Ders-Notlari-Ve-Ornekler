//
//  ViewController.swift
//  2-TextView
//
//  Created by Furkan on 20.08.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblText: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //Textview hem label gibi hemde textField gibi çalışır
    //Label gibi duruş segiler ama textfield gibide veri yazılabilir içine
    //çok satırlı veri ekleme işlemlerinde kullanılır

    @IBAction func txtToLbl(_ sender: Any) {
        if let data = textView.text{
            lblText.text = data
        }
    }
    
}

