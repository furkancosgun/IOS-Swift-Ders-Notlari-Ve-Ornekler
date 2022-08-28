//
//  ViewController.swift
//  12-Navigation-Controller-giris
//
//  Created by Furkan on 19.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var controller: UINavigationItem!//buraya navigation kısmını surukleuyerek
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        controller.title = "sad"//ve degisken tipinde degisiklik yaparak tittle degisebilir veya
        self.navigationItem.title = "bruhh"//Bu şekilde de navigation ogrelerine erieşebiliriz
    }
//Navigation controllr sadece 4 adet navigation item almaktadır

    
    //Eger başlık buyuk olsun sayfa scroll edilince kcuulsun istenirse
    //ana navigationa gidilir bar kısmına tıklanır ozelliklerine gidlir ve prefers large titles kısmı aktif edilir
    //ve surekli buyujk olsun istenirse herhnagi bir sayfada navbar item içinden automatic olayını degistirebilir
    
   // self.navigationItem.largeTitleDisplayMode = .always  //Kod ile de ayarlanbilir
    
}

