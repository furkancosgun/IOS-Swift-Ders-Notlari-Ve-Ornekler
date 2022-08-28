//
//  ViewController.swift
//  9-Show Segue Kod ile veri transfer
//
//  Created by Furkan on 19.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goTo2(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"Main",bundle:nil) //Story boar uzerinden sayfalar arasi gececez
        
        let screen2 = storyBoard.instantiateViewController(withIdentifier: "screen2") as! ViewController2
        //hangi sayfaya gececgimizi belirtiyoruz
        
        screen2.data = txtField.text//o sayfanın ozelliklerine erişim saglayabiliyor ve degisim yapabiliyoruz
        
        navigationController?.pushViewController(screen2, animated: true)//show gecisimiz yapılmıştır
    }
    
}

