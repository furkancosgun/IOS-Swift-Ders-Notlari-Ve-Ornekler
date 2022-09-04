//
//  ViewController.swift
//  1-Ses Oynatma
//
//  Created by Furkan on 2.09.2022.
//

import UIKit
import AVFoundation //Ses ve goruntu işlemler sınıfı

class ViewController: UIViewController {
    
    //Timer oluştuduk her sanşye işlem yapılması için
    var timer = Timer()
  
    @IBOutlet weak var musicTimer: UISlider!//Muzik saniye degeri
    var player = AVAudioPlayer()//Ses oynatıcı
    @IBOutlet weak var indLoad: UIActivityIndicatorView!//Muzik oynatılıyormu indicatoru
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let fileWay = Bundle.main.path(forResource: "music", ofType: ".mp3")//Dosya yoluna bundle ile erişilir
            
            //Oynatıcı içine muzik dosyası dosya yolu ile eklenir
            player = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: fileWay!))
            
            //Oynatmaya hazırlanması
            player.prepareToPlay()
        } catch  {
            print(error.localizedDescription)
        }
        
    }

    @IBAction func volumeSlider(_ sender: UISlider) {//Ses seviyesi slider fonksionu
        player.volume = sender.value//Slider degeri playerin ses degerine atanır
    }
    @IBAction func btnStart(_ sender: Any) {//Muzik başlatma fonk
        indLoad.startAnimating()//indicator animasyonu
        player.play()//player başlatılır
        
        //Timer herseferinde updatecounting fonksionunu çalıştırır
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.updateCounting()
           })
        
        //Music saniye degeri maximum valusu player içindeki muzigin uzunluguna eşit olur
        musicTimer.maximumValue = Float(player.duration)
    }
    
    
    @IBAction func btnStop(_ sender: Any) {//Muzik durdurma animasyonu
        indLoad.stopAnimating()//
        player.stop()
    }

          
    func updateCounting(){//Bu fonk musicTimer indicatorunu muzik playerin anlık time degerini alır
        musicTimer.value =  Float(player.currentTime)
    }
    @IBAction func timeCount(_ sender: UISlider) {//Time count slider fonksyonu
        player.currentTime = TimeInterval(sender.value)//playerin zamanına slider degeri atanır
        player.play()//Ve player tekrardan başlatılır
    }
    
    //Backgrounda çalışması için sign & capablites sekmesinden background mod eklenmesi gerekir
}

