//
//  ViewController3.swift
//  6-Sayfalar arasi gecis dinleme
//
//  Created by Furkan on 18.08.2022.
//

import UIKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Seguelar bizim viewcontroller arasındaki yaptıgımız show gecislerine verdigimiz idlerdir
        //viewcontroller id si degildir sayfalar arası main storyboard uzerinde yapılan gecislerin idsidir
        if segue.identifier == "goTo1"{//segue gecis id eşitse yapılan gecise
            print("3 ten bire donuldu")//yazdır
        }
        else if segue.identifier == "goTo2" {
            print("3 ten ikiye donuldu")
        }
    }


}
