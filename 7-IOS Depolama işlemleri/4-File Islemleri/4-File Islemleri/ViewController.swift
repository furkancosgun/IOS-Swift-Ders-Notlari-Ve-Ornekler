//
//  ViewController.swift
//  4-File Islemleri
//
//  Created by Furkan on 28.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func write(_ sender: Any) {
        
        //Metin degeri alınır
        let text:String = txtField.text!
        
        //Dosya yolu alınır
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            
            //Dosya yoluna text dosyası eklenir
            let dirWay = dir.appendingPathComponent("data.txt")
            
            //Do catch ile
            do {
                
                //string degeri yaz dedik(dosyaYoluna,bayta donuşturme,utf8 formatında)
                try text.write(to: dirWay, atomically: false, encoding: .utf8)
                
                //Deger alanını temizledik
                txtField.text = ""
            } catch  {
                print("Dosya yoluna erişilemedi")
            }
        }
    }
    
    @IBAction func read(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            
            //Dosya yoluna text dosyası eklenir
            let dirWay = dir.appendingPathComponent("data.txt")
            
            //Do catch ile
            do {
                
                //String fonksyonu ile dosya yolundan degeri text field içine ekler
                txtField.text = try String(contentsOf: dirWay, encoding: .utf8)
                
            } catch  {
                print("Dosya yoluna erişilemedi")
            }
        }
    }
    
    @IBAction func deleteTxt(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            
            //Dosya yoluna text dosyası eklenir
            let dirWay = dir.appendingPathComponent("data.txt")
            
            //Dosya yolu varmı yokmu onu kontrol ediyoruz
            if FileManager.default.fileExists(atPath: dirWay.path){
                
            //Do catch ile
            do {
                
                //Dosya yolundaki dosya silinir
               try FileManager.default.removeItem(at: dirWay)
                txtField.text = ""
            } catch  {
                print("Dosya yoluna erişilemedi")
            }
            }
        }
    }
    
    @IBAction func deleteImg(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            
            //Dosya yoluna text dosyası eklenir
            let dirWay = dir.appendingPathComponent("image.png")
            
            //Dosya yolu varmı yokmu onu kontrol ediyoruz
            if FileManager.default.fileExists(atPath: dirWay.path){
                
            //Do catch ile
            do {
                
                //Dosya yolundaki dosya silinir
               try FileManager.default.removeItem(at: dirWay)
                
            } catch  {
                print("Dosya yoluna erişilemedi")
            }
            }
        }
    }
    @IBAction func showImg(_ sender: Any) {
        //Dosya yolu alınır
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            
            //Dosya yoluna text dosyası eklenir
            let dirWay = dir.appendingPathComponent("image.png")
            
   
            //Do catch ile
            do {
                
                //imgView.image diyerek = UIImage sinifini kullanarak dosya yolundaki resim imgviewa eklenir
                try imgView.image = UIImage(contentsOfFile: dirWay.path)
                
            } catch  {
                print("Dosya yoluna erişilemedi")
            }
        }
    }
    @IBAction func saveImg(_ sender: Any) {
       
        //Dosya yolu alınır
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            
            //Dosya yoluna text dosyası eklenir
            let dirWay = dir.appendingPathComponent("image.png")
            
            //Asset dosyasındaki resim secilir
            let img = UIImage(named: "img")
            //Do catch ile
            do {
                
                //UIImage sinifi yardımıyla secilen resimimizi png formatına cevirerek dosya yoluna yazarız
                try img!.pngData()?.write(to: dirWay)
                
            } catch  {
                print("Dosya yoluna erişilemedi")
            }
        }
    }
}

