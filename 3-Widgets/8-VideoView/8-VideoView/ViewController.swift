//
//  ViewController.swift
//  8-VideoView
//
//  Created by Furkan on 20.08.2022.
//

import UIKit
//Vido goruntuleme işlemleri için sınıflar import edilir
import AVKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnStart(_ sender: Any) {//Butona tıklandıgında
        if let path = Bundle.main.path(forResource: "mac", ofType: "mp4"){//Verdigimiz dosya uzentısı ve adından video varsa
            
            let player = AVPlayer(url: URL(fileURLWithPath: path))//Oynatıcı oluşturur onun içine url olarak
            //bizim vido dosya yolumuzu veirirz
            
            let playerController = AVPlayerViewController()//oynatıcı için kontroller oluşuturuz bu işlem vidoyu ileri geri almak ses açma kapama vs işlemleri gercekleştirmek için kullanılır
            
            playerController.player = player//player kontrollerın oynatıcısına bizim oynatıcıyı verir eşleriz
            
            present(playerController, animated: true){//present işlemini sayfa gecişlerinden biliyoruz bunun sayesinde yeni sayfaya gecemeden ekran ustunde ekran işlemi ile vidoyu gosteririz
                
                player.play()//Ve videomuzu başlatırız
            }
        }
            
    }
}

