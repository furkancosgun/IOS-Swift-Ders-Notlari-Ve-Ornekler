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
        vidoStart()
    }


    func vidoStart() {//Butona tıklandıgında
      let url = URL(string: "https://d251.d2mefast.net/tb/0/c0/giderim_nisan_unsal_h264_41274.mp4")!
        
    
                           
                                DispatchQueue.main.async {
                                    
                                        
                                        
                                        let player =  AVPlayer(url: url)
                                        
                                        let playerController = AVPlayerViewController()//oynatıcı için kontroller oluşuturuz bu işlem vidoyu ileri geri almak ses açma kapama vs işlemleri gercekleştirmek için kullanılır
                                        
                                        playerController.player = player//player kontrollerın oynatıcısına bizim oynatıcıyı verir eşleriz
                                        
                                        self.present(playerController, animated: true){//present işlemini sayfa gecişlerinden biliyoruz bunun sayesinde yeni sayfaya gecemeden ekran ustunde ekran işlemi ile vidoyu gosteririz
                                            
                                            player.play()//Ve videomuzu başlatırız
                                        }
                                    
                                        
                                    
                                }
                            

       
            
    }
}

