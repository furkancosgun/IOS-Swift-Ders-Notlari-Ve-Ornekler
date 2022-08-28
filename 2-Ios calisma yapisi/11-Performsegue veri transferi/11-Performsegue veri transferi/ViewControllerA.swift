//
//  ViewControllerA.swift
//  11-Performsegue veri transferi
//
//  Created by Furkan on 19.08.2022.
//

import UIKit

class ViewControllerA: UIViewController {

    @IBOutlet weak var lblTEXT: UILabel!
    var data  : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTEXT.text = data!
        // Do any additional setup after loading the view.
    }
    

   

}
