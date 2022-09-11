//
//  ViewController.swift
//  3-MapKit ve CoreLocation Kullanimi
//
//  Created by Furkan on 11.09.2022.
//

import UIKit
import CoreLocation
import MapKit
class ViewController: UIViewController {

    @IBOutlet weak var lblHız: UILabel!
    @IBOutlet weak var lblBoylam: UILabel!
    @IBOutlet weak var lblEnlem: UILabel!
    @IBOutlet weak var mapKit: MKMapView!
    
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
        
        lblHız.text = "Hız: \(sonKonum.speed)"
        
        
        //Enlem ve boylam bilgisi degiskene atanır
        let konum = CLLocationCoordinate2D(latitude: sonKonum.coordinate.latitude, longitude: sonKonum.coordinate.longitude)
        
        //Yakınlaştırma işlemi
        //Deger ne kadar kucukse o kadar buyutme yapılır
        //Deger ne kadar buyukse o kadar kuculte uygulanır
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        //Gosterilecek bolge degerler eklenir
        let bolge = MKCoordinateRegion(center: konum,span: span)
        
        //Bolge Mapview içine eklenir
        mapKit.setRegion(bolge, animated: true)
        
        //userlocation bilgisi ile pin kullanmadan konum bilgisi noktası eklenebilir
        mapKit.showsUserLocation = true
        
        
    }
}

