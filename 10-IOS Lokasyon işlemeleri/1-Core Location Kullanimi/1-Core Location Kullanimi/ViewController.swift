//
//  ViewController.swift
//  1-Core Location Kullanimi
//
//  Created by Furkan on 11.09.2022.
//

import UIKit
import CoreLocation //Enlem boylam bilgisi için sınıf
//General alandan framework kısmına Corelocationframwork eklenir

//info dosyasından erişim izni alınır Privacy - Location When In Use Usage Description bu iismde ve value alanına açıklama eklenir
class ViewController: UIViewController {

    @IBOutlet weak var lblHiz: UILabel!
    @IBOutlet weak var lblBoylam: UILabel!
    @IBOutlet weak var lblEnlem: UILabel!
    
    var locManager : CLLocationManager = CLLocationManager()//Konum bilgisine erişmek için nesne
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Konum bilgisi kesinlik oranı
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //Konum bilgisi bize protocolm olarak gelcek
        locManager.delegate = self
        
        //Loksayon bilgi izni alınır
        locManager.requestWhenInUseAuthorization()
        
        //Konum bilgisi guncellemesi yapılır
        locManager.startUpdatingLocation()
    }

    
    
}

extension ViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let sonKonum : CLLocation = locations[locations.count-1]//location listesi içinde konumlar tutulur biz son konumu alcagımız için liste uzunlugunun bir eksigini alırız
        
        //son konum içinden enlem boylam ve hız bilgsisi labellar içine yazılır
        lblEnlem.text = "Enlem: \(sonKonum.coordinate.latitude)"
        
        lblBoylam.text = "Boylam: \(sonKonum.coordinate.longitude)"
        
        lblHiz.text = "Hız: \(sonKonum.speed)"
    }
}
