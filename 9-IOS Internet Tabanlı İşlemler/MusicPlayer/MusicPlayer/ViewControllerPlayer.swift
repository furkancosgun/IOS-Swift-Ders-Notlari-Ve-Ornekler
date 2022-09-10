//
//  ViewControllerPlayer.swift
//  MusicPlayer
//
//  Created by Furkan on 10.09.2022.
//

import UIKit
import AVFoundation
class ViewControllerPlayer: UIViewController {
    var timer = Timer()
    @IBOutlet weak var btnPP: UIButton!
    @IBOutlet weak var lblMusicDuration: UILabel!
    @IBOutlet weak var musicSlider: UISlider!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblNowTime: UILabel!
    var player = AVAudioPlayer()
    var music : Music?
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = music?.music_ad!
        
        //Image converter
        if let url = URL(string: (music?.music_img)!){
        DispatchQueue.global().async {
                          //Siteye erişim sagalnıyorsa bu url data tipine cevrilir
            let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.imgView.image = UIImage(data: data!)//Data tipi uimage yardımı ile ekrana basılrı
                }
            }
        }
        
        //Music preparer
        prepareMusic(musicUrl: (music?.music_url!)!)
        
      
    }
    
    func prepareMusic(musicUrl:String){
        if let url = URL(string: musicUrl){
                            
        DispatchQueue.global().async {
                                
                                //Siteye erişim sagalnıyorsa bu url data tipine cevrilir
            let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                
                    do {
                                        
                                        //Oynatıcı içine muzik dosyası dosya yolu ile eklenir
                        self.player = try AVAudioPlayer(data: data!)
                                        
                                        //Oynatmaya hazırlanması
                        self.player.prepareToPlay()
                        self.musicSlider.maximumValue = Float(self.player.duration)
                        let duration = Float(self.player.duration)/60
                        self.lblMusicDuration.text = String(format: "%.2f", duration)
                        //Music saniye degeri maximum valusu player içindeki muzigin uzunluguna eşit olur
                        self.musicSlider.maximumValue = Float(self.player.duration)
                        } catch {
                            print(error.localizedDescription)
                        }
                                    
                        }
                }
        }
        
    }

    

    @IBAction func btnBack(_ sender: Any) {
        player.currentTime -= 5
        player.play()
        
    }
    
    @IBAction func btnForward(_ sender: Any) {
        player.currentTime += 5
        player.play()
    }
    
    @IBAction func btnSS(_ sender: Any) {
        if player.isPlaying{
            player.stop()
            timer.invalidate()
            self.btnPP.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }else{
            self.btnPP.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            player.play()//player başlatılır
            
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { _ in
            self.updateMusicSlider()
            
        })
        }
       

    }
    func updateMusicSlider(){//Bu fonk musicTimer indicatorunu muzik playerin anlık time degerini alır
           musicSlider.value =  Float(player.currentTime)
        lblNowTime.text =  String(format: "%.2f", player.currentTime/60)
       }
}
