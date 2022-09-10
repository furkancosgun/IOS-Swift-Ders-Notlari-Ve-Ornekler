//
//  ViewController.swift
//  4-Internet uzerinden resim alma
//
//  Created by Furkan on 8.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnChange(_ sender: Any) {
        
        //Url oluştrulur url e erişiliyorsa if içine girilir
        if let url = URL(string: txtUrl.text!){
            
            //Asenkron olarak siteye erişim saglanır
            DispatchQueue.global().async {
                
                //Siteye erişim sagalnıyorsa bu url data tipine cevrilir
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.imgView.image = UIImage(data: data!)//Data tipi uimage yardımı ile ekrana basılrı
                }
            }
        }
    }
    
}

