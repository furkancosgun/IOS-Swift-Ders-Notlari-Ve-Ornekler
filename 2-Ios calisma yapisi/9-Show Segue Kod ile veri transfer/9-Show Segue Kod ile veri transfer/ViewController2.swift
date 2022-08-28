//
//  ViewController2.swift
//  9-Show Segue Kod ile veri transfer
//
//  Created by Furkan on 19.08.2022.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var lbltext: UILabel!
    var data : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        lbltext.text  = data!
        // Do any additional setup after loading the view.
    }
    


}
