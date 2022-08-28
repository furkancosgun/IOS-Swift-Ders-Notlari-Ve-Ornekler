//
//  ViewController.swift
//  13-Basliga-Image ekleme
//
//  Created by Furkan on 19.08.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Baslık kısmına kod ile resim ekleme
        //oncelikkle asset icine herhangi bir reism eklenir
        let image = UIImage(named: "amed")//resim ismi verilir
        self.navigationItem.titleView = UIImageView(image: image)//titleview alanında gosterilir
    }


}

