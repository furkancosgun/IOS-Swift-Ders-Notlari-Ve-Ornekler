//
//  ViewController2.swift
//  Artir-Azalt
//
//  Created by Furkan on 21.08.2022.
//

import UIKit

class ViewController2: UIViewController {
    var predrict : Int? = nil
    var value : Int? = nil
    
    @IBOutlet weak var lblPredrict: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if value == predrict {
            imgView.image = UIImage(systemName: "person.fill.checkmark")
            lblStatus.text = "Dogru Tahmin Ettiniz :D"
            lblPredrict.text = "Tahmininiz: \(predrict!)"
        }else{
            imgView.image = UIImage(systemName: "person.fill.xmark")
            lblStatus.text = "Tahmininiz Yanlış :( Tahmin edilmesi gereken sayı:\(value!)"
            lblPredrict.text = "Tahmininiz: \(predrict!)"
        }
    }
    

}
