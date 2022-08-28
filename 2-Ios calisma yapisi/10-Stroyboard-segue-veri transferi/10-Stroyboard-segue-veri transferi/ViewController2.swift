//
//  ViewController2.swift
//  10-Stroyboard-segue-veri transferi
//
//  Created by Furkan on 19.08.2022.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    var data : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        lblText.text = data!
        // Do any additional setup after loading the view.
    }
    


}
