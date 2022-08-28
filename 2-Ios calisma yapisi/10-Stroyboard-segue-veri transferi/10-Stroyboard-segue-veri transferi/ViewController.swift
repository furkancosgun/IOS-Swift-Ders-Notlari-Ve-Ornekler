//
//  ViewController.swift
//  10-Stroyboard-segue-veri transferi
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let message = textField.text //Mesaj text field içinden alınır
        
        if segue.identifier == "goToA"{//istenilen yere istenilen mesajı gondermek için hangi
                                        //sayfaya gittigimizi yakalıyoruz
            
            let going = segue.destination as! ViewController2
            //gidilecek olan yeri casting yaparak bir nesneye donusturuyoruz
            
            going.data = message//ve nesnenin(gidilecek yerin) degiskenlerine veya ozelliklerine
                                //erişip degisim saglayabiliyoruz
        }
        else if segue.identifier == "goToB"{
            let going = segue.destination as! ViewController3
            going.data = message
        }
        
    }

}

