//
//  ViewController.swift
//  7-Kod ile Gecis tetikleme
//
//  Created by Furkan on 18.08.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //Kod ile Segue tetikelemk için ilk olarak gecisin tetiklenecegi
    //sayfanın viewcontrollerinindna cntrl mouse ile gecis olacak sayfaya dogru surukle bırak yapılır
    //ve gecis tipi secilir daha sonra bir id ataması yaopılır bu segue ye
    
    @IBAction func goto2(_ sender: Any) {
        let data = "Merhaba"//Degisken oluşturup
        
        //Sayfalar arası geciste sender icerisine deger verip degiskeni taşıyabiliriz
        performSegue(withIdentifier: "goTo2", sender: data)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Sayfalr arası gecis yaparken sender icindeki veriyi ekrana basıyopurz
        
        let gelenData = sender as? String
        //Any tipinden downcasting yaparak string tipine cevirir ekrana yazarız
        print(gelenData!)
        print("İkinci sayfaya gecis yapildi")
        
    }
}

